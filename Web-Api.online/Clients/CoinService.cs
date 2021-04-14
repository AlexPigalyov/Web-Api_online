using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json.Linq;
using Web_Api.online.Clients.Models;
using Web_Api.online.Clients.Interfaces;

namespace Web_Api.online.Clients
{
    public partial class CoinService : ICoinService
    {
        protected readonly IRestRequestClient _restRequestClient;

        public CoinParameters Parameters { get; }

        public CoinService(IConfiguration configuration)
        {
            _restRequestClient = new RestRequestClient(this);
            Parameters = new CoinParameters(this, configuration, null, null, null, null, 0);
        }

        public CoinService(IConfiguration configuration, bool useTestnet) : this(configuration)
        {
            Parameters.UseTestnet = useTestnet;
        }

        public CoinService(IConfiguration configuration, string daemonUrl, string rpcUsername, string rpcPassword, string walletPassword)
        {
            _restRequestClient = new RestRequestClient(this);
            Parameters = new CoinParameters(this, configuration, daemonUrl, rpcUsername, rpcPassword, walletPassword, 0);
        }

        //  this provides support for cases where *.config files are not an option
        public CoinService(IConfiguration configuration, string daemonUrl, string rpcUsername, string rpcPassword, string walletPassword, short rpcRequestTimeoutInSeconds)
        {
            _restRequestClient = new RestRequestClient(this);
            Parameters = new CoinParameters(this, configuration, daemonUrl, rpcUsername, rpcPassword, walletPassword, rpcRequestTimeoutInSeconds);
        }

        public string AddMultiSigAddress(int nRquired, List<string> publicKeys, string account)
        {
            return account != null
                ? _restRequestClient.MakeRequest<string>(RestMethods.addmultisigaddress, nRquired, publicKeys, account)
                : _restRequestClient.MakeRequest<string>(RestMethods.addmultisigaddress, nRquired, publicKeys);
        }

        public void AddNode(string node, NodeAction action)
        {
            _restRequestClient.MakeRequest<string>(RestMethods.addnode, node, action.ToString());
        }

        public string AddWitnessAddress(string address)
        {
            return _restRequestClient.MakeRequest<string>(RestMethods.addwitnessaddress, address);
        }

        public void BackupWallet(string destination)
        {
            _restRequestClient.MakeRequest<string>(RestMethods.backupwallet, destination);
        }

        public CreateMultiSigResponse CreateMultiSig(int nRquired, List<string> publicKeys)
        {
            return _restRequestClient.MakeRequest<CreateMultiSigResponse>(RestMethods.createmultisig, nRquired, publicKeys);
        }

        public string CreateRawTransaction(CreateRawTransactionRequest rawTransaction)
        {
            return _restRequestClient.MakeRequest<string>(RestMethods.createrawtransaction, rawTransaction.Inputs, rawTransaction.Outputs);
        }

        /// <summary>
        /// Lower level CreateRawTransaction RPC request to allow other kinds of output, e.g.
        /// "data":"text" for OP_RETURN Null Data for chat on the blockchain. CreateRawTransaction(
        /// CreateRawTransactionRequest) only allows for "receiver":amount outputs.
        /// </summary>
        public string CreateRawTransaction(IList<CreateRawTransactionInput> inputs,
            string chatHex, string receiverAddress, decimal receiverAmount)
        {
            // Must be a dictionary to become an json object, an array will fail on the RPC side
            var outputs = new Dictionary<string, string>
                    {
                        { "data", chatHex },
                        { receiverAddress, receiverAmount.ToString(NumberFormatInfo.InvariantInfo) }
                    };
            return _restRequestClient.MakeRequest<string>(RestMethods.createrawtransaction, inputs, outputs);
        }

        public DecodeRawTransactionResponse DecodeRawTransaction(string rawTransactionHexString)
        {
            return _restRequestClient.MakeRequest<DecodeRawTransactionResponse>(RestMethods.decoderawtransaction, rawTransactionHexString);
        }

        public DecodeScriptResponse DecodeScript(string hexString)
        {
            return _restRequestClient.MakeRequest<DecodeScriptResponse>(RestMethods.decodescript, hexString);
        }

        public string DumpPrivKey(string bitcoinAddress)
        {
            return _restRequestClient.MakeRequest<string>(RestMethods.dumpprivkey, bitcoinAddress);
        }

        public void DumpWallet(string filename)
        {
            _restRequestClient.MakeRequest<string>(RestMethods.dumpwallet, filename);
        }

        public decimal EstimateFee(ushort nBlocks)
        {
            return _restRequestClient.MakeRequest<decimal>(RestMethods.estimatefee, nBlocks);
        }

        public EstimateSmartFeeResponse EstimateSmartFee(ushort nBlocks)
        {
            return _restRequestClient.MakeRequest<EstimateSmartFeeResponse>(RestMethods.estimatesmartfee, nBlocks);
        }

        public decimal EstimatePriority(ushort nBlocks)
        {
            return _restRequestClient.MakeRequest<decimal>(RestMethods.estimatepriority, nBlocks);
        }

        public string GetAccount(string bitcoinAddress)
        {
            return _restRequestClient.MakeRequest<string>(RestMethods.getaccount, bitcoinAddress);
        }

        public string GetAccountAddress(string account)
        {
            return _restRequestClient.MakeRequest<string>(RestMethods.getaccountaddress, account);
        }

        public GetAddedNodeInfoResponse GetAddedNodeInfo(string dns, string node)
        {
            return string.IsNullOrWhiteSpace(node)
                ? _restRequestClient.MakeRequest<GetAddedNodeInfoResponse>(RestMethods.getaddednodeinfo, dns)
                : _restRequestClient.MakeRequest<GetAddedNodeInfoResponse>(RestMethods.getaddednodeinfo, dns, node);
        }

        public List<string> GetAddressesByAccount(string account)
        {
            return _restRequestClient.MakeRequest<List<string>>(RestMethods.getaddressesbyaccount, account);
        }

        public Dictionary<string, GetAddressesByLabelResponse> GetAddressesByLabel(string label)
        {
            return _restRequestClient.MakeRequest<Dictionary<string, GetAddressesByLabelResponse>>(RestMethods.getaddressesbylabel, label);
        }

        public GetAddressInfoResponse GetAddressInfo(string bitcoinAddress)
        {
            return _restRequestClient.MakeRequest<GetAddressInfoResponse>(RestMethods.getaddressinfo, bitcoinAddress);
        }

        public decimal GetBalance(string account, int minConf, bool? includeWatchonly)
        {
            return includeWatchonly == null
                ? _restRequestClient.MakeRequest<decimal>(RestMethods.getbalance, (string.IsNullOrWhiteSpace(account) ? "*" : account), minConf)
                : _restRequestClient.MakeRequest<decimal>(RestMethods.getbalance, (string.IsNullOrWhiteSpace(account) ? "*" : account), minConf, includeWatchonly);
        }

        public string GetBestBlockHash()
        {
            return _restRequestClient.MakeRequest<string>(RestMethods.getbestblockhash);
        }

        public GetBlockResponse GetBlock(string hash, bool verbose)
        {
            return _restRequestClient.MakeRequest<GetBlockResponse>(RestMethods.getblock, hash, verbose);
        }

        public GetBlockResponseVerbose GetBlock(string hash, int verbosity)
        {
            if (verbosity < 2)
            {
                throw new ArgumentException("This method is only available for verbosity levels above 1. Please use method where 2nd argument is a boolean instead.");
            }

            return _restRequestClient.MakeRequest<GetBlockResponseVerbose>(RestMethods.getblock, hash, verbosity);
        }

        public GetBlockchainInfoResponse GetBlockchainInfo()
        {
            return _restRequestClient.MakeRequest<GetBlockchainInfoResponse>(RestMethods.getblockchaininfo);
        }

        public uint GetBlockCount()
        {
            return _restRequestClient.MakeRequest<uint>(RestMethods.getblockcount);
        }

        public string GetBlockHash(long index)
        {
            return _restRequestClient.MakeRequest<string>(RestMethods.getblockhash, index);
        }

        public GetBlockTemplateResponse GetBlockTemplate(params object[] parameters)
        {
            return parameters == null
                ? _restRequestClient.MakeRequest<GetBlockTemplateResponse>(RestMethods.getblocktemplate)
                : _restRequestClient.MakeRequest<GetBlockTemplateResponse>(RestMethods.getblocktemplate, parameters);
        }

        public List<GetChainTipsResponse> GetChainTips()
        {
            return _restRequestClient.MakeRequest<List<GetChainTipsResponse>>(RestMethods.getchaintips);
        }

        public int GetConnectionCount()
        {
            return _restRequestClient.MakeRequest<int>(RestMethods.getconnectioncount);
        }

        public double GetDifficulty()
        {
            return _restRequestClient.MakeRequest<double>(RestMethods.getdifficulty);
        }

        public bool GetGenerate()
        {
            return _restRequestClient.MakeRequest<bool>(RestMethods.getgenerate);
        }

        [Obsolete("Please use calls: GetWalletInfo(), GetBlockchainInfo() and GetNetworkInfo() instead")]
        public GetInfoResponse GetInfo()
        {
            return _restRequestClient.MakeRequest<GetInfoResponse>(RestMethods.getinfo);
        }

        public GetMemPoolInfoResponse GetMemPoolInfo()
        {
            return _restRequestClient.MakeRequest<GetMemPoolInfoResponse>(RestMethods.getmempoolinfo);
        }

        public GetMiningInfoResponse GetMiningInfo()
        {
            return _restRequestClient.MakeRequest<GetMiningInfoResponse>(RestMethods.getmininginfo);
        }

        public GetNetTotalsResponse GetNetTotals()
        {
            return _restRequestClient.MakeRequest<GetNetTotalsResponse>(RestMethods.getnettotals);
        }

        public ulong GetNetworkHashPs(uint blocks, long height)
        {
            return _restRequestClient.MakeRequest<ulong>(RestMethods.getnetworkhashps);
        }

        public GetNetworkInfoResponse GetNetworkInfo()
        {
            return _restRequestClient.MakeRequest<GetNetworkInfoResponse>(RestMethods.getnetworkinfo);
        }

        public string GetNewAddress(string account)
        {
            return string.IsNullOrWhiteSpace(account)
                ? _restRequestClient.MakeRequest<string>(RestMethods.getnewaddress)
                : _restRequestClient.MakeRequest<string>(RestMethods.getnewaddress, account);
        }

        public List<GetPeerInfoResponse> GetPeerInfo()
        {
            return _restRequestClient.MakeRequest<List<GetPeerInfoResponse>>(RestMethods.getpeerinfo);
        }

        public GetRawMemPoolResponse GetRawMemPool(bool verbose)
        {
            var getRawMemPoolResponse = new GetRawMemPoolResponse
            {
                IsVerbose = verbose
            };

            var rpcResponse = _restRequestClient.MakeRequest<object>(RestMethods.getrawmempool, verbose);

            if (!verbose)
            {
                var rpcResponseAsArray = (JArray)rpcResponse;

                foreach (string txId in rpcResponseAsArray)
                {
                    getRawMemPoolResponse.TxIds.Add(txId);
                }

                return getRawMemPoolResponse;
            }

            IList<KeyValuePair<string, JToken>> rpcResponseAsKvp = (new EnumerableQuery<KeyValuePair<string, JToken>>(((JObject)(rpcResponse)))).ToList();
            IList<JToken> children = JObject.Parse(rpcResponse.ToString()).Children().ToList();

            for (var i = 0; i < children.Count(); i++)
            {
                var getRawMemPoolVerboseResponse = new GetRawMemPoolVerboseResponse
                {
                    TxId = rpcResponseAsKvp[i].Key
                };

                getRawMemPoolResponse.TxIds.Add(getRawMemPoolVerboseResponse.TxId);

                foreach (var property in children[i].SelectMany(grandChild => grandChild.OfType<JProperty>()))
                {
                    switch (property.Name)
                    {
                        case "currentpriority":

                            double currentPriority;

                            if (double.TryParse(property.Value.ToString(), out currentPriority))
                            {
                                getRawMemPoolVerboseResponse.CurrentPriority = currentPriority;
                            }

                            break;

                        case "depends":

                            foreach (var jToken in property.Value)
                            {
                                getRawMemPoolVerboseResponse.Depends.Add(jToken.Value<string>());
                            }

                            break;

                        case "fee":

                            decimal fee;

                            if (decimal.TryParse(property.Value.ToString(), out fee))
                            {
                                getRawMemPoolVerboseResponse.Fee = fee;
                            }

                            break;

                        case "height":

                            int height;

                            if (int.TryParse(property.Value.ToString(), out height))
                            {
                                getRawMemPoolVerboseResponse.Height = height;
                            }

                            break;

                        case "size":

                            int size;

                            if (int.TryParse(property.Value.ToString(), out size))
                            {
                                getRawMemPoolVerboseResponse.Size = size;
                            }

                            break;

                        case "startingpriority":

                            double startingPriority;

                            if (double.TryParse(property.Value.ToString(), out startingPriority))
                            {
                                getRawMemPoolVerboseResponse.StartingPriority = startingPriority;
                            }

                            break;

                        case "time":

                            int time;

                            if (int.TryParse(property.Value.ToString(), out time))
                            {
                                getRawMemPoolVerboseResponse.Time = time;
                            }

                            break;

                        default:

                            throw new Exception("Unkown property: " + property.Name + " in GetRawMemPool()");
                    }
                }
                getRawMemPoolResponse.VerboseResponses.Add(getRawMemPoolVerboseResponse);
            }
            return getRawMemPoolResponse;
        }

        public string GetRawChangeAddress()
        {
            return _restRequestClient.MakeRequest<string>(RestMethods.getrawchangeaddress);
        }

        public GetRawTransactionResponse GetRawTransaction(string txId, int verbose)
        {
            if (verbose == 0)
            {
                return new GetRawTransactionResponse
                {
                    Hex = _restRequestClient.MakeRequest<string>(RestMethods.getrawtransaction, txId, verbose)
                };
            }

            if (verbose == 1)
            {
                return _restRequestClient.MakeRequest<GetRawTransactionResponse>(RestMethods.getrawtransaction, txId, verbose);
            }

            throw new Exception("Invalid verbose value: " + verbose + " in GetRawTransaction()!");
        }

        public decimal GetReceivedByAccount(string account, int minConf)
        {
            return _restRequestClient.MakeRequest<decimal>(RestMethods.getreceivedbyaccount, account, minConf);
        }

        public decimal GetReceivedByAddress(string bitcoinAddress, int minConf)
        {
            return _restRequestClient.MakeRequest<decimal>(RestMethods.getreceivedbyaddress, bitcoinAddress, minConf);
        }

        public decimal GetReceivedByLabel(string bitcoinAddress, int minConf)
        {
            return _restRequestClient.MakeRequest<decimal>(RestMethods.getreceivedbylabel, bitcoinAddress, minConf);
        }

        public GetTransactionResponse GetTransaction(string txId, bool? includeWatchonly)
        {
            return includeWatchonly == null
                ? _restRequestClient.MakeRequest<GetTransactionResponse>(RestMethods.gettransaction, txId)
                : _restRequestClient.MakeRequest<GetTransactionResponse>(RestMethods.gettransaction, txId, includeWatchonly);
        }

        public GetTransactionResponse GetTxOut(string txId, int n, bool includeMemPool)
        {
            return _restRequestClient.MakeRequest<GetTransactionResponse>(RestMethods.gettxout, txId, n, includeMemPool);
        }

        public GetTxOutSetInfoResponse GetTxOutSetInfo()
        {
            return _restRequestClient.MakeRequest<GetTxOutSetInfoResponse>(RestMethods.gettxoutsetinfo);
        }

        public decimal GetUnconfirmedBalance()
        {
            return _restRequestClient.MakeRequest<decimal>(RestMethods.getunconfirmedbalance);
        }

        public GetWalletInfoResponse GetWalletInfo()
        {
            return _restRequestClient.MakeRequest<GetWalletInfoResponse>(RestMethods.getwalletinfo);
        }

        public string Help(string command)
        {
            return string.IsNullOrWhiteSpace(command)
                ? _restRequestClient.MakeRequest<string>(RestMethods.help)
                : _restRequestClient.MakeRequest<string>(RestMethods.help, command);
        }

        public void ImportAddress(string address, string label, bool rescan)
        {
            _restRequestClient.MakeRequest<string>(RestMethods.importaddress, address, label, rescan);
        }

        public string ImportPrivKey(string privateKey, string label, bool rescan)
        {
            return _restRequestClient.MakeRequest<string>(RestMethods.importprivkey, privateKey, label, rescan);
        }

        public void ImportWallet(string filename)
        {
            _restRequestClient.MakeRequest<string>(RestMethods.importwallet, filename);
        }

        public string KeyPoolRefill(uint newSize)
        {
            return _restRequestClient.MakeRequest<string>(RestMethods.keypoolrefill, newSize);
        }

        public Dictionary<string, decimal> ListAccounts(int minConf, bool? includeWatchonly)
        {
            return includeWatchonly == null
                ? _restRequestClient.MakeRequest<Dictionary<string, decimal>>(RestMethods.listaccounts, minConf)
                : _restRequestClient.MakeRequest<Dictionary<string, decimal>>(RestMethods.listaccounts, minConf, includeWatchonly);
        }

        public List<List<ListAddressGroupingsResponse>> ListAddressGroupings()
        {
            var unstructuredResponse = _restRequestClient.MakeRequest<List<List<List<object>>>>(RestMethods.listaddressgroupings);
            var structuredResponse = new List<List<ListAddressGroupingsResponse>>(unstructuredResponse.Count);

            for (var i = 0; i < unstructuredResponse.Count; i++)
            {
                for (var j = 0; j < unstructuredResponse[i].Count; j++)
                {
                    if (unstructuredResponse[i][j].Count > 1)
                    {
                        var response = new ListAddressGroupingsResponse
                        {
                            Address = unstructuredResponse[i][j][0].ToString()
                        };

                        decimal balance;
                        if (decimal.TryParse(unstructuredResponse[i][j][1].ToString(), out balance))
                        {
                            response.Balance = balance;
                        }

                        if (unstructuredResponse[i][j].Count > 2)
                        {
                            response.Account = unstructuredResponse[i][j][2].ToString();
                        }

                        if (structuredResponse.Count < i + 1)
                        {
                            structuredResponse.Add(new List<ListAddressGroupingsResponse>());
                        }

                        structuredResponse[i].Add(response);
                    }
                }
            }
            return structuredResponse;
        }

        public List<string> ListLabels()
        {
            return _restRequestClient.MakeRequest<List<string>>(RestMethods.listlabels);
        }

        public string ListLockUnspent()
        {
            return _restRequestClient.MakeRequest<string>(RestMethods.listlockunspent);
        }

        public List<ListReceivedByAccountResponse> ListReceivedByAccount(int minConf, bool includeEmpty, bool? includeWatchonly)
        {
            return includeWatchonly == null
                ? _restRequestClient.MakeRequest<List<ListReceivedByAccountResponse>>(RestMethods.listreceivedbyaccount, minConf, includeEmpty)
                : _restRequestClient.MakeRequest<List<ListReceivedByAccountResponse>>(RestMethods.listreceivedbyaccount, minConf, includeEmpty, includeWatchonly);
        }

        public List<ListReceivedByAddressResponse> ListReceivedByAddress(int minConf, bool includeEmpty, bool? includeWatchonly)
        {
            return includeWatchonly == null
                ? _restRequestClient.MakeRequest<List<ListReceivedByAddressResponse>>(RestMethods.listreceivedbyaddress, minConf, includeEmpty)
                : _restRequestClient.MakeRequest<List<ListReceivedByAddressResponse>>(RestMethods.listreceivedbyaddress, minConf, includeEmpty, includeWatchonly);
        }

        public List<ListReceivedByLabelResponse> ListReceivedByLabel(int minConf, bool includeEmpty, bool? includeWatchonly)
        {
            return _restRequestClient.MakeRequest<List<ListReceivedByLabelResponse>>(RestMethods.listreceivedbylabel, minConf, includeEmpty, includeWatchonly);
        }

        public ListSinceBlockResponse ListSinceBlock(string blockHash, int targetConfirmations, bool? includeWatchonly)
        {
            return includeWatchonly == null
                ? _restRequestClient.MakeRequest<ListSinceBlockResponse>(RestMethods.listsinceblock, (string.IsNullOrWhiteSpace(blockHash) ? "" : blockHash), targetConfirmations)
                : _restRequestClient.MakeRequest<ListSinceBlockResponse>(RestMethods.listsinceblock, (string.IsNullOrWhiteSpace(blockHash) ? "" : blockHash), targetConfirmations, includeWatchonly);
        }

        public List<ListTransactionsResponse> ListTransactions(string account, int count, int from, bool? includeWatchonly)
        {
            return includeWatchonly == null
                ? _restRequestClient.MakeRequest<List<ListTransactionsResponse>>(RestMethods.listtransactions, (string.IsNullOrWhiteSpace(account) ? "*" : account), count, from)
                : _restRequestClient.MakeRequest<List<ListTransactionsResponse>>(RestMethods.listtransactions, (string.IsNullOrWhiteSpace(account) ? "*" : account), count, from, includeWatchonly);
        }

        public List<ListUnspentResponse> ListUnspent(int minConf, int maxConf, List<string> addresses)
        {
            return _restRequestClient.MakeRequest<List<ListUnspentResponse>>(RestMethods.listunspent, minConf, maxConf, (addresses ?? new List<string>()));
        }

        public bool LockUnspent(bool unlock, IList<ListUnspentResponse> listUnspentResponses)
        {
            IList<object> transactions = new List<object>();

            foreach (var listUnspentResponse in listUnspentResponses)
            {
                transactions.Add(new
                {
                    txid = listUnspentResponse.TxId,
                    vout = listUnspentResponse.Vout
                });
            }

            return _restRequestClient.MakeRequest<bool>(RestMethods.lockunspent, unlock, transactions.ToArray());
        }

        public bool Move(string fromAccount, string toAccount, decimal amount, int minConf, string comment)
        {
            return _restRequestClient.MakeRequest<bool>(RestMethods.move, fromAccount, toAccount, amount, minConf, comment);
        }

        public void Ping()
        {
            _restRequestClient.MakeRequest<string>(RestMethods.ping);
        }

        public bool PrioritiseTransaction(string txId, decimal priorityDelta, decimal feeDelta)
        {
            return _restRequestClient.MakeRequest<bool>(RestMethods.prioritisetransaction, txId, priorityDelta, feeDelta);
        }

        public string SendFrom(string fromAccount, string toBitcoinAddress, decimal amount, int minConf, string comment, string commentTo)
        {
            return _restRequestClient.MakeRequest<string>(RestMethods.sendfrom, fromAccount, toBitcoinAddress, amount, minConf, comment, commentTo);
        }

        public string SendMany(string fromAccount, Dictionary<string, decimal> toBitcoinAddress, int minConf, string comment)
        {
            return _restRequestClient.MakeRequest<string>(RestMethods.sendmany, fromAccount, toBitcoinAddress, minConf, comment);
        }

        public string SendRawTransaction(string rawTransactionHexString, bool? allowHighFees)
        {
            return allowHighFees == null
                ? _restRequestClient.MakeRequest<string>(RestMethods.sendrawtransaction, rawTransactionHexString)
                : _restRequestClient.MakeRequest<string>(RestMethods.sendrawtransaction, rawTransactionHexString, allowHighFees);
        }

        public string SendToAddress(string bitcoinAddress, decimal amount, string comment, string commentTo, bool subtractFeeFromAmount)
        {
            return _restRequestClient.MakeRequest<string>(RestMethods.sendtoaddress, bitcoinAddress, amount, comment, commentTo, subtractFeeFromAmount);
        }

        public string SetAccount(string bitcoinAddress, string account)
        {
            return _restRequestClient.MakeRequest<string>(RestMethods.setaccount, bitcoinAddress, account);
        }

        public string SetLabel(string bitcoinAddress, string label)
        {
            return _restRequestClient.MakeRequest<string>(RestMethods.setlabel, bitcoinAddress, label);
        }

        public string SetGenerate(bool generate, short generatingProcessorsLimit)
        {
            return _restRequestClient.MakeRequest<string>(RestMethods.setgenerate, generate, generatingProcessorsLimit);
        }

        public string SetTxFee(decimal amount)
        {
            return _restRequestClient.MakeRequest<string>(RestMethods.settxfee, amount);
        }

        public string SignMessage(string bitcoinAddress, string message)
        {
            return _restRequestClient.MakeRequest<string>(RestMethods.signmessage, bitcoinAddress, message);
        }

        public SignRawTransactionResponse SignRawTransaction(SignRawTransactionRequest request)
        {
            #region default values

            if (request.Inputs.Count == 0)
            {
                request.Inputs = null;
            }

            if (string.IsNullOrWhiteSpace(request.SigHashType))
            {
                request.SigHashType = SigHashType.All;
            }

            if (request.PrivateKeys.Count == 0)
            {
                request.PrivateKeys = null;
            }

            #endregion

            return _restRequestClient.MakeRequest<SignRawTransactionResponse>(RestMethods.signrawtransaction, request.RawTransactionHex, request.Inputs, request.PrivateKeys, request.SigHashType);
        }

        public SignRawTransactionWithKeyResponse SignRawTransactionWithKey(SignRawTransactionWithKeyRequest request)
        {
            #region default values

            if (request.PrivateKeys.Count == 0)
            {
                request.PrivateKeys = null;
            }

            if (request.Inputs.Count == 0)
            {
                request.Inputs = null;
            }

            if (string.IsNullOrWhiteSpace(request.SigHashType))
            {
                request.SigHashType = SigHashType.All;
            }

            #endregion

            return _restRequestClient.MakeRequest<SignRawTransactionWithKeyResponse>(RestMethods.signrawtransactionwithkey, request.RawTransactionHex, request.PrivateKeys, request.Inputs, request.SigHashType);
        }

        public SignRawTransactionWithWalletResponse SignRawTransactionWithWallet(SignRawTransactionWithWalletRequest request)
        {
            #region default values

            if (request.Inputs.Count == 0)
            {
                request.Inputs = null;
            }

            if (string.IsNullOrWhiteSpace(request.SigHashType))
            {
                request.SigHashType = SigHashType.All;
            }

            #endregion

            return _restRequestClient.MakeRequest<SignRawTransactionWithWalletResponse>(RestMethods.signrawtransactionwithwallet, request.RawTransactionHex, request.Inputs, request.SigHashType);
        }

        public GetFundRawTransactionResponse GetFundRawTransaction(string rawTransactionHex)
        {
            return _restRequestClient.MakeRequest<GetFundRawTransactionResponse>(RestMethods.fundrawtransaction, rawTransactionHex);
        }

        public string Stop()
        {
            return _restRequestClient.MakeRequest<string>(RestMethods.stop);
        }

        public string SubmitBlock(string hexData, params object[] parameters)
        {
            return parameters == null
                ? _restRequestClient.MakeRequest<string>(RestMethods.submitblock, hexData)
                : _restRequestClient.MakeRequest<string>(RestMethods.submitblock, hexData, parameters);
        }

        public ValidateAddressResponse ValidateAddress(string bitcoinAddress)
        {
            return _restRequestClient.MakeRequest<ValidateAddressResponse>(RestMethods.validateaddress, bitcoinAddress);
        }

        public bool VerifyChain(ushort checkLevel, uint numBlocks)
        {
            return _restRequestClient.MakeRequest<bool>(RestMethods.verifychain, checkLevel, numBlocks);
        }

        public bool VerifyMessage(string bitcoinAddress, string signature, string message)
        {
            return _restRequestClient.MakeRequest<bool>(RestMethods.verifymessage, bitcoinAddress, signature, message);
        }

        public string WalletLock()
        {
            return _restRequestClient.MakeRequest<string>(RestMethods.walletlock);
        }

        public string WalletPassphrase(string passphrase, int timeoutInSeconds)
        {
            return _restRequestClient.MakeRequest<string>(RestMethods.walletpassphrase, passphrase, timeoutInSeconds);
        }

        public string WalletPassphraseChange(string oldPassphrase, string newPassphrase)
        {
            return _restRequestClient.MakeRequest<string>(RestMethods.walletpassphrasechange, oldPassphrase, newPassphrase);
        }

        public override string ToString()
        {
            return Parameters.CoinLongName;
        }
    }
}
