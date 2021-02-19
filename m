Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7CE332000D
	for <lists+linux-leds@lfdr.de>; Fri, 19 Feb 2021 22:00:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbhBSVAG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 19 Feb 2021 16:00:06 -0500
Received: from smtpx.feld.cvut.cz ([147.32.210.153]:34503 "EHLO
        smtpx.feld.cvut.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbhBSVAG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 19 Feb 2021 16:00:06 -0500
X-Greylist: delayed 440 seconds by postgrey-1.27 at vger.kernel.org; Fri, 19 Feb 2021 16:00:04 EST
Received: from localhost (styx [192.168.200.7])
        by smtpx.feld.cvut.cz (Postfix) with ESMTP id C8A8141700;
        Fri, 19 Feb 2021 21:52:02 +0100 (CET)
X-Virus-Scanned: IMAP STYX AMAVIS
Received: from smtpx.feld.cvut.cz ([192.168.200.2])
        by localhost (styx.feld.cvut.cz [192.168.200.7]) (amavisd-new, port 10060)
        with ESMTP id mPBEzbQL2z-M; Fri, 19 Feb 2021 21:52:00 +0100 (CET)
Received: from imap.feld.cvut.cz (imap.feld.cvut.cz [147.32.210.222])
        by smtpx.feld.cvut.cz (Postfix) with ESMTP id 88EFE413F8;
        Fri, 19 Feb 2021 21:52:00 +0100 (CET)
From:   =?utf-8?Q?Zbyn=C4=9Bk_Kocur?= <zbynek.kocur@fel.cvut.cz>
Message-Id: <1E2EF21D-A304-46C4-9370-4FEBFD4767D2@fel.cvut.cz>
Content-Type: multipart/signed;
        boundary="Apple-Mail=_2E8DA451-B76B-4368-A7CA-EC6180EA1C5C";
        protocol="application/pkcs7-signature";
        micalg=sha-256
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v2] leds: apu: extend support for PC Engines APU1 with
 newer firmware
Date:   Fri, 19 Feb 2021 21:51:58 +0100
In-Reply-To: <20210219143711.GA28202@meh.true.cz>
Cc:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Andreas Eberlein <foodeas@aeberlein.de>,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     =?utf-8?Q?Petr_=C5=A0tetiar?= <ynezz@true.cz>
References: <20210216133028.4025-1-foodeas@aeberlein.de>
 <c7eebbb6-df0c-51df-7701-ecb8f6543466@metux.net>
 <20210219143711.GA28202@meh.true.cz>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Apple-Mail=_2E8DA451-B76B-4368-A7CA-EC6180EA1C5C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Petr =C5=A0tetiar <ynezz@true.cz>


Hi Peter,

Thanks for adding to the discussion. I tested the proposed modification =
on APU1 with different versions of bios.=20
The LED subsystem now behaves the same as the APU2 and higher. If it =
needs more tests on various boards
 from PCengines, I'm available.


Tested-by: Zbyn=C4=9Bk Kocur <zbynek.kocur@fel.cvut.cz>


Zbyn=C4=9Bk=

--Apple-Mail=_2E8DA451-B76B-4368-A7CA-EC6180EA1C5C
Content-Disposition: attachment;
	filename=smime.p7s
Content-Type: application/pkcs7-signature;
	name=smime.p7s
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCDXow
ggaMMIIEdKADAgECAhEAjccpAsDT9VGQNkn5saQIvjANBgkqhkiG9w0BAQwFADBGMQswCQYDVQQG
EwJOTDEZMBcGA1UEChMQR0VBTlQgVmVyZW5pZ2luZzEcMBoGA1UEAxMTR0VBTlQgUGVyc29uYWwg
Q0EgNDAeFw0yMTAyMDEwMDAwMDBaFw0yNDAyMDEyMzU5NTlaMIH9MQ8wDQYDVQQREwYxNjAgMDAx
MzAxBgNVBAoMKsSMZXNrw6kgdnlzb2vDqSB1xI1lbsOtIHRlY2huaWNrw6kgdiBQcmF6ZTErMCkG
A1UECQwiSnVnb3Nsw6F2c2vDvWNoIHBhcnR5esOhbsWvIDE1ODAvMzEeMBwGA1UECAwVUHJhaGEs
IEhsYXZuw60gbcSbc3RvMRowGAYDVQQHExFQcmFoYSA2IC0gRGVqdmljZTELMAkGA1UEBhMCQ1ox
FjAUBgNVBAMMDVpieW7Em2sgS29jdXIxJzAlBgkqhkiG9w0BCQEWGHpieW5lay5rb2N1ckBmZWwu
Y3Z1dC5jejCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAIdRN/oFd1DLnU4WMVitQMzz
OciHSW3JqzYkby5eWv1pkFnlpeqnIjEtZIC2DKSLBw0MfLfCUpjnT5C73I5DECfK3EEN+7OsccpG
Za6fhIUH8c1/l/QgqYnoa3gXotJ6eLg3E7DUc72Y7LeB0DKpow9Js8lXgbWzbKsOW95Qkd8bO+bS
tQsekAbiyk5F73jFujOZ8eb2zc6vZMa+aPxnrAcrijC43Z9NTKydKqThUX9/vI9CqWL+U3ryxY2K
zNr/TEkBP1S2g4xFuse5yj4cL9Hue+uIwj0EOJ6u4oaADBa6bm/BcfKrdJOWvm8/GVC/avVjv1M3
9dIZ6WiVaqmPxFcCAwEAAaOCAbswggG3MB8GA1UdIwQYMBaAFGkAocchWPjgxRsgsArdp1G/E9nk
MB0GA1UdDgQWBBQeADUgMaLLH0FsuNkwTK7lPPjEDzAOBgNVHQ8BAf8EBAMCBaAwDAYDVR0TAQH/
BAIwADAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwPwYDVR0gBDgwNjA0BgsrBgEEAbIx
AQICTzAlMCMGCCsGAQUFBwIBFhdodHRwczovL3NlY3RpZ28uY29tL0NQUzBCBgNVHR8EOzA5MDeg
NaAzhjFodHRwOi8vR0VBTlQuY3JsLnNlY3RpZ28uY29tL0dFQU5UUGVyc29uYWxDQTQuY3JsMHgG
CCsGAQUFBwEBBGwwajA9BggrBgEFBQcwAoYxaHR0cDovL0dFQU5ULmNydC5zZWN0aWdvLmNvbS9H
RUFOVFBlcnNvbmFsQ0E0LmNydDApBggrBgEFBQcwAYYdaHR0cDovL0dFQU5ULm9jc3Auc2VjdGln
by5jb20wOQYDVR0RBDIwMIEUWmJ5bmVrLktvY3VyQGN2dXQuY3qBGHpieW5lay5rb2N1ckBmZWwu
Y3Z1dC5jejANBgkqhkiG9w0BAQwFAAOCAgEAFQ/cuZ8vH8nfnkb+vZg3WOIYsEdHdXq5TS7ZKOvM
5KHGL2YZ6VTTPMOMSDR8zKT7w0scWKMlPURv6tlehIjDQsJ+pdkkq5WjHUM7av5jap0lazd3bTiU
gxQxQfQhsevs6Nq2tf5tQmwRrROezy+5Fvf3k3gv1csviLszVMVUCFx6tWkAdfIaxl1pXIG+Kl/S
fLdWsxaJxhlh6lknaP+UHS/N0aCcQwBja1NSEt8emK/ehk+DfyqLr1hrXKSj44wm5xRuZ2FdYTo7
32XW2IACEyGCufi95UVIzdCyXFiRKrfII+KhUFf3nCcnfIDPCLm4Xz5YMv2xQHxxoVk1OkTjeczx
/OC6VlyTORc+q2JHGrTTEFKnb+9fzDQgtFcvzhmt9P1+Js5w6O51UnNN/cA2nJTFknLZlsBXBc0O
ctx145dmLfw+hvVcWWuaiFhIX0MOD9KZ9Dc36NteaV8gyq7G8c1pHna8XBH873pWixZf0UiZ4IF7
ajvxE97KBVzS+iVTF0JDA09F5KINBSS6HiUKyBamGAzkaM3xRyxcJSu4bzX2qG9gioLw671PSvVU
2ebMT8a5LZnnqrkoHQnv0YKZ/4ijtQVc1iYaRgj1emq/sRe616159u0Y/lkmIo67MOTF4xcCjGjA
DKGVeTh6mCIZPpTYqHSlWyQ5Mz0SKxKfjKgwggbmMIIEzqADAgECAhAxAnDUNb6bJJr4VtDh4oVJ
MA0GCSqGSIb3DQEBDAUAMIGIMQswCQYDVQQGEwJVUzETMBEGA1UECBMKTmV3IEplcnNleTEUMBIG
A1UEBxMLSmVyc2V5IENpdHkxHjAcBgNVBAoTFVRoZSBVU0VSVFJVU1QgTmV0d29yazEuMCwGA1UE
AxMlVVNFUlRydXN0IFJTQSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTAeFw0yMDAyMTgwMDAwMDBa
Fw0zMzA1MDEyMzU5NTlaMEYxCzAJBgNVBAYTAk5MMRkwFwYDVQQKExBHRUFOVCBWZXJlbmlnaW5n
MRwwGgYDVQQDExNHRUFOVCBQZXJzb25hbCBDQSA0MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIIC
CgKCAgEAs0riIl4nW+kEWxQENTIgFK600jFAxs1QwB6hRMqvnkphfy2Q3mKbM2otpELKlgE8/3AQ
PYBo7p7yeORuPMnAuA+oMGRb2wbeSaLcZbpwXgfCvnKxmq97/kQkOFX706F9O7/h0yehHhDjUdyM
yT0zMs4AMBDRrAFn/b2vR3j0BSYgoQs16oSqadM3p+d0vvH/YrRMtOhkvGpLuzL8m+LTAQWvQJ92
NwCyKiHspoP4mLPJvVpEpDMnpDbRUQdftSpZzVKTNORvPrGPRLnJ0EEVCHR82LL6oz915WkrgeCY
9ImuulBn4uVsd9ZpubCgM/EXvVBlViKqusChSsZEn7juIsGIiDyaIhhLsd3amm8BS3bgK6AxdSMR
OND6hiHT182Lmf8C+gRHxQG9McvG35uUvRu8v7bPZiJRaT7ZC2f50P4lTlnbLvWpXv5yv7hheO8b
MXltiyLweLB+VNvg+GnfL6TW3Aq1yF1yrZAZzR4MbpjTWdEdSLKvz8+0wCwscQ81nbDOwDt9vyZ+
0eJXbRkWZiqScnwAg5/B1NUD4TrYlrI4n6zFp2pyYUOiuzP+as/AZnz63GvjFK69WODR2W/TK4D7
VikEMhg18vhuRf4hxnWZOy0vhfDR/g3aJbdsGac+diahjEwzyB+UKJOCyzvecG8bZ/u/U8PsEMZg
07iIPi8CAwEAAaOCAYswggGHMB8GA1UdIwQYMBaAFFN5v1qqK0rPVIDh2JvAnfKyA2bLMB0GA1Ud
DgQWBBRpAKHHIVj44MUbILAK3adRvxPZ5DAOBgNVHQ8BAf8EBAMCAYYwEgYDVR0TAQH/BAgwBgEB
/wIBADAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwOAYDVR0gBDEwLzAtBgRVHSAAMCUw
IwYIKwYBBQUHAgEWF2h0dHBzOi8vc2VjdGlnby5jb20vQ1BTMFAGA1UdHwRJMEcwRaBDoEGGP2h0
dHA6Ly9jcmwudXNlcnRydXN0LmNvbS9VU0VSVHJ1c3RSU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5
LmNybDB2BggrBgEFBQcBAQRqMGgwPwYIKwYBBQUHMAKGM2h0dHA6Ly9jcnQudXNlcnRydXN0LmNv
bS9VU0VSVHJ1c3RSU0FBZGRUcnVzdENBLmNydDAlBggrBgEFBQcwAYYZaHR0cDovL29jc3AudXNl
cnRydXN0LmNvbTANBgkqhkiG9w0BAQwFAAOCAgEACgVOew2PHxM5AP1v7GLGw+3tF6rjAcx43D9H
l110Q+BABABglkrPkES/VyMZsfuds8fcDGvGE3o5UfjSno4sij0xdKut8zMazv8/4VMKPCA3EUS0
tDUoL01ugDdqwlyXuYizeXyH2ICAQfXMtS+raz7mf741CZvO50OxMUMxqljeRfVPDJQJNHOYi2px
uxgjKDYx4hdZ9G2o+oLlHhu5+anMDkE8g0tffjRKn8I1D1BmrDdWR/IdbBOj6870abYvqys1qYlP
otv5N5dm+XxQ8vlrvY7+kfQaAYeO3rP1DM8BGdpEqyFVa+I0rpJPhaZkeWW7cImDQFerHW9bKzBr
CC815a3WrEhNpxh72ZJZNs1HYJ+29NTB6uu4NJjaMxpk+g2puNSm4b9uVjBbPO9V6sFSG+IBqE9c
kX/1XjzJtY8Grqoo4SiRb6zcHhp3mxj3oqWi8SKNohAOKnUc7RIP6ss1hqIFyv0xXZor4N9tnzD0
Fo0JDIURjDPEgo5WTdti/MdGTmKFQNqxyZuT9uSI2Xvhz8p+4pCYkiZqpahZlHqMFxdw9XRZQgrP
+cgtOkWEaiNkRBbvtvLdp7MCL2OsQhQEdEbUvDM9slzZXdI7NjJokVBq3O4pls3VD2z3L/bHVBe0
rBERjyM2C/HSIh84rfmAqBgklzIOqXhd+4RzadUxggLNMIICyQIBATBbMEYxCzAJBgNVBAYTAk5M
MRkwFwYDVQQKExBHRUFOVCBWZXJlbmlnaW5nMRwwGgYDVQQDExNHRUFOVCBQZXJzb25hbCBDQSA0
AhEAjccpAsDT9VGQNkn5saQIvjANBglghkgBZQMEAgEFAKCCAUMwGAYJKoZIhvcNAQkDMQsGCSqG
SIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjEwMjE5MjA1MTU4WjAvBgkqhkiG9w0BCQQxIgQgNg1E
X9PxS+x/aFCCEmVS+X9ZyTFc1m3mQlbS5EDu9XQwagYJKwYBBAGCNxAEMV0wWzBGMQswCQYDVQQG
EwJOTDEZMBcGA1UEChMQR0VBTlQgVmVyZW5pZ2luZzEcMBoGA1UEAxMTR0VBTlQgUGVyc29uYWwg
Q0EgNAIRAI3HKQLA0/VRkDZJ+bGkCL4wbAYLKoZIhvcNAQkQAgsxXaBbMEYxCzAJBgNVBAYTAk5M
MRkwFwYDVQQKExBHRUFOVCBWZXJlbmlnaW5nMRwwGgYDVQQDExNHRUFOVCBQZXJzb25hbCBDQSA0
AhEAjccpAsDT9VGQNkn5saQIvjANBgkqhkiG9w0BAQsFAASCAQBzM6RZM3sRXE5uF0zOaK6/VNGJ
LMoC3W2Y+w8i41XfacV8T/AmcgBl8rJa26ArzeGuo75ivoSKFx62a8NGirUz+Hz4LlgRpQJQTKjJ
S0XWI/1iKmMyJjaMZy954BfAUg7GbFMM9CYr6nDqVUvTRgXG2r6FLT8AX1h1joaoAaAomjSUYLf/
1Z9iMlY2LwU5BNOhbhW+urzieWN8Qt4Fl37PgK0W6iraoHd0tF61ESp2yMtYIfpq58niDIBeV4ko
KzfMRncZt17CQux6p1tqsC0v8HkFvRY/FzXaSdJ3s02kKxi4q/VPWZk7QkvnZ+DX4GXOuXcM88O/
38bjcDk1AgFeAAAAAAAA
--Apple-Mail=_2E8DA451-B76B-4368-A7CA-EC6180EA1C5C--
