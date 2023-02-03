using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Newtonsoft.Json;
using xNet;
using System.Threading.Tasks;
using System.Text.RegularExpressions;
using Web_Api.online.Services;

namespace Web_Api.online.Models
{
    public class QiwiApi
    {
        private QiwiService _qiwiService;

        public QiwiApi(QiwiService qiwiService)
        {
            _qiwiService = qiwiService;
        }


        public bool Payment(QiwiPayment payment)
        {
            var q = new QiwiObject();
            if (q.auth(payment.Login, payment.Pwd))
            {
                return q.payments(payment.Recipient, payment.Amount, payment.Comment);
            }

            return false;
        }

        public bool PaymentBankCard(QiwiPayment payment)
        {
            var q = new QiwiObject();
            if (q.auth(payment.Login, payment.Pwd))
            {
                return q.paymentBankCard(payment.Recipient, payment.Amount);
            }

            return false;
        }

        public async Task<bool> MakePayment(string recipient, double amount)
        {
            Phones acc = await _qiwiService.GetQiwiAcoountCashOut(amount);

            QiwiPayment item = new QiwiPayment
            {
                Login = acc.Number,
                Pwd = acc.Pwd,
                Recipient = recipient,
                Amount = amount,
                Comment = "eCats platform"
            };

            bool result = Payment(item);

            var q = new QiwiObject();
            q.CheckQiwiAccountBalance(acc.Number, acc.Pwd);

            return result;
        }

        public async Task<bool> MakePaymentBankCard(string recipient, double amount)
        {
            Phones acc = await _qiwiService.GetQiwiAcoountCashOut(amount);

            QiwiPayment item = new QiwiPayment
            {
                Login = acc.Number,
                Pwd = acc.Pwd,
                Recipient = recipient,
                Amount = amount,
                Comment = "eCats platform"
            };

            bool result = PaymentBankCard(item);

            var q = new QiwiObject();
            q.CheckQiwiAccountBalance(acc.Number, acc.Pwd);

            return result;
        }
    }
}