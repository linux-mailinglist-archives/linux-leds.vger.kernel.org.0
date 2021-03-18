Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDD0C3401F5
	for <lists+linux-leds@lfdr.de>; Thu, 18 Mar 2021 10:25:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbhCRJY3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 18 Mar 2021 05:24:29 -0400
Received: from us-smtp-delivery-115.mimecast.com ([170.10.133.115]:22058 "EHLO
        us-smtp-delivery-115.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229847AbhCRJY2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Thu, 18 Mar 2021 05:24:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maxlinear.com;
        s=selector; t=1616059467;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=us2Q1q76ONjfAyL1MAJxMexczGyE1EY2Y7k8dqpgUYI=;
        b=HYePFMRL1V1pjq4iTc0mKGe93c3048BcFwY1ITm1/mhuQZtyyjDmBv5YoiIHrBrmMQPUCS
        fxayPTncAE65+TWTVRll1aGuHIJAryEE37lE5foQlfCT+7RyaOXnjmb2SpwlxfomuDUSje
        Fc8fp+BGAsBAWOBY0vRbUpSznBsw1Kc=
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-zPigkCOwMU-flkkSDO1x2A-1; Thu, 18 Mar 2021 05:24:25 -0400
X-MC-Unique: zPigkCOwMU-flkkSDO1x2A-1
Received: from MN2PR19MB3693.namprd19.prod.outlook.com (2603:10b6:208:18a::19)
 by BL0PR1901MB1986.namprd19.prod.outlook.com (2603:10b6:207:31::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Thu, 18 Mar
 2021 09:24:23 +0000
Received: from MN2PR19MB3693.namprd19.prod.outlook.com
 ([fe80::1cd9:22:e5ef:6d10]) by MN2PR19MB3693.namprd19.prod.outlook.com
 ([fe80::1cd9:22:e5ef:6d10%7]) with mapi id 15.20.3933.032; Thu, 18 Mar 2021
 09:24:22 +0000
From:   Rahul Tanwar <rtanwar@maxlinear.com>
To:     Randy Dunlap <rdunlap@infradead.org>, Pavel Machek <pavel@ucw.cz>
CC:     Arnd Bergmann <arnd@kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Adam Borowski <kilobyte@angband.pl>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        John Crispin <john@phrozen.org>,
        Hauke Mehrtens <hmehrtens@maxlinear.com>,
        Cheol Yong Kim <ckim@maxlinear.com>,
        Qiming Wu <qwu@maxlinear.com>
Subject: Re: [PATCH 1/1] leds: lgm: Improve Kconfig help
Thread-Topic: [PATCH 1/1] leds: lgm: Improve Kconfig help
Thread-Index: AQHXGwlKnpCn2fIGT0qLVmIAnSpIpQ==
Date:   Thu, 18 Mar 2021 09:24:22 +0000
Message-ID: <MN2PR19MB3693144BDCCAEF6F7FAB6BC0B1699@MN2PR19MB3693.namprd19.prod.outlook.com>
References: <8ae0456a08ef1a2491fd382b273ff7259e6fcbd0.1615969806.git.rtanwar@maxlinear.com>
 <MN2PR19MB3693EEA37EA1FC18238FE45EB16A9@MN2PR19MB3693.namprd19.prod.outlook.com>
 <42a0c810-4b6f-1853-60c9-e36a9dc6100a@infradead.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [222.164.90.248]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ca85b3c-47e7-441d-fda2-08d8e9ef9ddb
x-ms-traffictypediagnostic: BL0PR1901MB1986:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR1901MB1986C915B2EF3A6890E116EFB1699@BL0PR1901MB1986.namprd19.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: xHPxrqJt+wYO6quIn5vmHRLwjkHJVWT+8H7z6QaHEZVfFFoLO4ZBhSqKu/7bkmWNqKZYKqwyNkGhFvKg6Vz7rU0kvv2uPLdCNHg+sfjJF/TOOsaPk/uoCKuFLmI1bLFCZUwRBOSr2hy7UpuT+PDXyoVc1iLUZnG/795NOtw0HKoVlftdZ/eqpjibOOfHpCzNku8zhzp29gtP6ghNDyWqODDpgsl1Lk/6+zwgRXlDnptJeN34reRuw47aAIpGtkKPJO8tYNvCQmQ2M0e19HyyqjEJJSi02McQL3I5VyKSKibGTyF0FQwy7CTMcL4MtuzNT5figd+IE5DLRAy0uPRwrTZ9BGJZawR/xDbkjbwXQM2RcrnAfBqm/nXfZWL0L/yCuF5hLxwaFldZCzlc/kZ17B5GvAZ0lJACymE0Woe0jjQdVhnqHfkhYBuEjP8jGdojf4+ms7xHsxnGZZDHSOSsEmJcyvRzu8AVnHVkSAEHeAgkf4ZKtMYhOErtDNLghdMfExh+RD4fjl/qVv7zTJ+1In7Yrx5OYix7JhtDjh1y6L3FYjb7Rm+MFZ8KfWWrfGCUvvIYQ6pXTEnJvS0BQfunbefxPNEwlVIURCtzJn7Ne0ejIXd3P26ac5z04WTX+Xny
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR19MB3693.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(39850400004)(136003)(346002)(9686003)(107886003)(26005)(66476007)(64756008)(478600001)(76116006)(86362001)(55016002)(110136005)(66556008)(53546011)(7696005)(54906003)(4326008)(91956017)(66446008)(52536014)(8676002)(83380400001)(8936002)(316002)(33656002)(186003)(5660300002)(38100700001)(71200400001)(2906002)(66946007)(6506007);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Bg2SIJQjP0OMwuNvgZ2/7YCk1v5x2Bw4q9oGYkDjJf1OCnKPlOsz8LbOTykq?=
 =?us-ascii?Q?w4nlEkE8zNPN7JQ9IA/q3OXOCorGU9ACu2suxViGDgpqrLfWMBnEiuOgNSAI?=
 =?us-ascii?Q?yi/2iX7CcEuWZe+p1jkVLVexjEwDUdVfMhvPWI7SdHHI6y/Xst/iD9Rr9Bli?=
 =?us-ascii?Q?kdQJmhNWG2o5shl3hb+FsZdass4glQRom2/GG+jVOZf56l3pbW3uJ2EgJ7OR?=
 =?us-ascii?Q?uPEhQSEtIAHNyjUExsSbZ0OKe8/1XakBXUVeG2DFwGUdIXZJuwyKBmwnTBo8?=
 =?us-ascii?Q?kFfnIunzZ+rOdxoUTz+ni+FIEsRBhAXdxNKWwXwBPsDOrF1UCYWOEBzu5bSA?=
 =?us-ascii?Q?2ZgnWNV4X4iRQ8/2/RkC47/SOMSEJsF3nZJz45FLpfJomFsd3GPSuRxrkRj8?=
 =?us-ascii?Q?UsyhaVFHJOPzIq8/EnQPaZigOWoocD5TczpfEQ59Sbech/Rpja/kdwSFmSAC?=
 =?us-ascii?Q?EZFIQLK/Q24W/3dc8LFi3GyIc8Ua+vWW0f0GtYwJNRWvJdNcYavI54xmo2NH?=
 =?us-ascii?Q?5IJp69/HzW+VpVcwPbTVViNcYfbSRVzo9/dQpLc3XLa8GWgqKhFPgjhEmwoL?=
 =?us-ascii?Q?MjEM9unZ1pgdAJwXK/YE9eo7j1CiBFWZqjeSHvfXjzLFnckLdD3EElMv+Sp/?=
 =?us-ascii?Q?LFgiXouXNY/7o/s3eXXXlWFsUcTU9Cp8uZe7aXlejacAIHSGOVw8SVagUvX4?=
 =?us-ascii?Q?AR1auATFCYAGB9vF4eu2a9INKmGieofDHd5xKqTHEWs1Rw1yD6N4o+CelgpG?=
 =?us-ascii?Q?UDRyrgJGZk+eEVEq8E0qJG+IO/G1GWwZKLs+1wyF0nr6us8o553qA0iy/oiD?=
 =?us-ascii?Q?hJggf380QBXeVR3nHcSJxBTasaCKtYImV87+su2/+zRXu56AVcjyMExgiuaX?=
 =?us-ascii?Q?F3khSiaq7UmLDDVn4AaVZbgJ0ii8jZ7sTDF3aSoZ4cBv8oHeXaTAn/RHxmdI?=
 =?us-ascii?Q?syWNZTHxfnslVp6LqTV77PLxl1J8mTwscd8pqxjO4by8TmG6Dl+VCvQMvwKc?=
 =?us-ascii?Q?+Plc6KN/aqfdXQC7sH+Pbg5gWPCZvk2Do123LrXWk2iJUJOSNPxg/vR/KFIY?=
 =?us-ascii?Q?2lmpsDfiDYAyKN2drMgo0Faaz0UMDV54c++RGE2dHEH5wAsmKtxnYZC3pn/J?=
 =?us-ascii?Q?GsfD/xuurS+RtGjK8CoBot+m19XShQSkcRUOXYV4PUjx9AzRxSJsc+TPn3YP?=
 =?us-ascii?Q?PsEl9WWp1n1nmn/qjUh+ounjF97UK4mMYVLOWvn+8SmIjFREKtfAIW0JswuU?=
 =?us-ascii?Q?oi6RHV8zGnX6BKA8zH9VMHrzvPtiEXjC7IxWTYNCOZV7D/Aa4X1lOMViIxWD?=
 =?us-ascii?Q?UoebDIkPbRomVfFhEwztGrWVMPIO0V/jA/v5G3ZbZtfEcg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: maxlinear.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR19MB3693.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ca85b3c-47e7-441d-fda2-08d8e9ef9ddb
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2021 09:24:22.5842
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dac28005-13e0-41b8-8280-7663835f2b1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bLTqfOt31vV0KT0b6WS1puv9GCoPAff4ttnjTcMPuMXceECrcZWmaJ+zaoEPLIsTAjK0ZD0WmEX7VdkFJmdnNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR1901MB1986
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=CUSA115A51 smtp.mailfrom=rtanwar@maxlinear.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: maxlinear.com
Content-Language: en-US
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Randy,=0A=0AOn 18/3/2021 11:02 am, Randy Dunlap wrote:=0A> This email wa=
s sent from outside of MaxLinear.=0A>=20=0A>=20=0A> Hi,=0A>=20=0A> For the =
leds/blink/Kconfig file at least, something has=0A> changed all of the tabs=
 to spaces.=0A>=20=0A> Keywords in Kconfig files should be indented with on=
e tab,=0A> while help text should be indented with one tab + 2 spaces.=0A>=
=0A=0A=0AHmm, facing some IT issues with git send-email so i had to send it=
 by=20=0Aother means. I will fix it in V1 by ensuring that i send using git=
.=0A=0A=0A>=20=0A> On 3/17/21 3:04 AM, Rahul Tanwar wrote:=0A>> Remove unne=
cessary Kconfig symbol LEDS_BLINK=0A>> Improve Kconfig help text to make it=
 more useful.=0A>>=0A>> Signed-off-by: Rahul Tanwar <rtanwar@maxlinear.com>=
=0A>> ---=0A>>=0A>> diff --git a/drivers/leds/blink/Kconfig b/drivers/leds/=
blink/Kconfig=0A>> index 6dedc58c47b3..2de2973fbc6b 100644=0A>> --- a/drive=
rs/leds/blink/Kconfig=0A>> +++ b/drivers/leds/blink/Kconfig=0A>> @@ -1,21 +=
1,19 @@=0A>> -menuconfig LEDS_BLINK=0A>> -       bool "LED Blink support"=
=0A>> -       depends on LEDS_CLASS=0A>> -       help=0A>> -         This o=
ption enables blink support for the leds class.=0A>> -         If unsure, s=
ay Y.=0A>> -=0A>> -if LEDS_BLINK=0A>> -=0A>> -config LEDS_BLINK_LGM=0A>> - =
      tristate "LED support for Intel LGM SoC series"=0A>> +config LEDS_LGM=
=0A>> +       tristate "LED support for LGM SoC series"=0A>>           depe=
nds on GPIOLIB=0A>>           depends on LEDS_CLASS=0A>>           depends =
on MFD_SYSCON=0A>>           depends on OF=0A>>           help=0A>> -      =
   Parallel to serial conversion, which is also called SSO=0A>> controller,=
=0A>> -         can drive external shift register for LED outputs.=0A>> -  =
       This enables LED support for Serial Shift Output controller(SSO).=0A=
>> +         This option enables support for LEDs connected to GPIO lines o=
n=0A>> +         Lightning Mountain(LGM) SoC. These LEDs are driven by a Se=
rial=0A>=20=0A>                        Mountain (LGM)=0A>=20=0A>> +        =
 Shift Output(SSO) controller. The driver supports hardware=0A>=20=0A>     =
               Output (SSO)=0A>=20=0A>> +         blinking with a configura=
ble LED update/blink frequency in two=0A>> +         modes, 2/4/8/10 Hz in =
low speed mode and 50/100/200/250 KHz in=0A>> +         high speed mode. Th=
e LEDs can be configured to be triggered by=0A>> +         SW/CPU or by har=
dware. Say 'Y' here if you are working on LGM=0A>=20=0A> Please spell out "=
software".=0A>=20=0A>> +         SoC based platform.=0A>> +=0A>> +         =
To compile this driver as a module, choose M here: the=0A>> +         modul=
e will be called leds-lgm-sso.=0A>>=0A>> -endif # LEDS_BLINK=0A>=20=0A=0AWe=
ll noted about above improvements suggestions. Shall update in V1. Thanks.=
=0A=0ARegards,=0ARahul=0A=0A> thanks.=0A> --=0A> ~Randy=0A>=20=0A>=20=0A=0A

