Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48D223CCFFE
	for <lists+linux-leds@lfdr.de>; Mon, 19 Jul 2021 11:06:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235691AbhGSIYM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 19 Jul 2021 04:24:12 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:36560 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236055AbhGSIYH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 19 Jul 2021 04:24:07 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16J8COC4023523;
        Mon, 19 Jul 2021 08:22:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=Mxril52xNxRMoevCNjKQ+JvjYSzo5l29YnCeALAdG5k=;
 b=rKHeN4J3qkmGez7AlS8YWjOCsJBDyX4gWSJ4RxOCNP6HIsEAXfaKjKz4UdSiRInf6Dbd
 MhjJwTNfEhGoQ+LgdarHFQIB/GzHQxEW18BZmt5eIg7WaZmvzdximeA/vMIMeA38rdjB
 w242Aq1KNA5Xtc6wK/mC5C6bjyo1QleZNyXgqyodnHg0GxhDOBiSOb9Ud4TJHoFa5fPi
 xknRf+h7113s7fw7HiYpdK7XcM8G4r9XF39S2XWuHIA4xn1lDNfyPI5+4P7ly/dAd8tK
 M9tXKweyBYSNEgsAMv8hi/4DzW9cO9nSHby1BPJwVTxnVo4J8NKSUCRKED5JSKqyQ8m6 IQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2020-01-29; bh=Mxril52xNxRMoevCNjKQ+JvjYSzo5l29YnCeALAdG5k=;
 b=ASYIhHLoBh64Nw1FzZD7wOat+PtDtbJ2lR/MOqU1IY0gre2PtiEz25W1xJ4fglfsOrtH
 z4UMwP5ZW+UIjLJTDZYhKQag43epwYjSJyaActuj9cchlcmKhz2tusBhZQF+p4mNs6Rb
 bhtBFiYJtZnjLvmHC1FpvzkzFBAeBFqFCA+ZMEA59hg7/c3mSBpnopU8Cz3MBVkuwAAf
 zbpALHBLN1xtJ0EAgCCx21Yo18/FNYt2GddgapC9ROYLWeqwDP71h6h5gwOZ6A8csYHV
 6/BCsH3Fmu+P0atfs8Mup5wZ7hZ3txjdL7yhG6/iJP7DY9A9A17JfmbLZji23io7a5LE ig== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 39vpkwrveh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 19 Jul 2021 08:22:05 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16J8AQaa052196;
        Mon, 19 Jul 2021 08:22:04 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2041.outbound.protection.outlook.com [104.47.51.41])
        by userp3030.oracle.com with ESMTP id 39umawgawh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 19 Jul 2021 08:22:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e1g49TVFCunQKK8wZPih9DSojStLRaM3/NRWnhBfMw0G3laFcVc5cUXdrkRjBfcaiaMweQmVIriyN6LGF0EiCDU9PlQU8MT0l+ffDsuaoSm7YRg64rZPcbQe0e+SKhh6HAv1akD6/4/kTsm1JwFfLzmRyG716wvAhE826SIYVM7Ktl1UY2+lw3XAfUWlTCdvKybCPxfrIzoUd496VANu/Dgc6JxJTquX8ggWSSQiNkhW6W8HR1mRCF0+ZVLF5lfoOWg/tMWLkFd2BGvctIdWgALfvkafBhvOobQ/pWXxGh6CtKe3wE4/jwuJ92TGaN91MbUGAUCA/Y/Hk6hjSSkWHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mxril52xNxRMoevCNjKQ+JvjYSzo5l29YnCeALAdG5k=;
 b=PA5lvih2HFiHGhFc2CRwt6n1PlE5vMcNNgG3vABaT58XscJT5Xw2I/PeuypiIcSdyJGjocSGiHVtHMmnNNWbxgTEWkPGXYQZNPlzNhIQuKSyvRdeJcYpBYW2SLGQKDa9MgiqYx/1fTOqVYYikqGwPzpuQxjEr5TwJKC37VtUoNaI93jfDVz5pQ5HuLbxVzuq1en4GrJeXimZJp0/CK39UCfGBfgSF0hbJJ4/GaVQWkFXTdCQnw4eShBjqQCnSFOYRG4Qa7NHMPoWP52qgh6cDz0Zoi7jmIYBb0hU3fFOiiNSu4n6RiB5Qm2SlzglncSR9W5uJ20du8TFv333HXVIVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mxril52xNxRMoevCNjKQ+JvjYSzo5l29YnCeALAdG5k=;
 b=xfXqD+ilHrRfmyJ7nu+fgmzvca4jnAxsQe0M7mswLfQfXmPFIpzAO377KDZ6a2bnNet0VuWquXpPSXoXxaTRg9OWlydfOmRN3/qxabAEbIaks4iBxSkAW5gAHVii7VJvSt6Z1loHiadz0YAOm+95i3KkquvhMjMEP/kmHu9pEtk=
Authentication-Results: lists.01.org; dkim=none (message not signed)
 header.d=none;lists.01.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1951.namprd10.prod.outlook.com
 (2603:10b6:300:10a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.24; Mon, 19 Jul
 2021 08:22:02 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4331.033; Mon, 19 Jul 2021
 08:22:02 +0000
Date:   Mon, 19 Jul 2021 11:21:41 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kbuild@lists.01.org, Amy Parker <apark0006@student.cerritos.edu>,
        pavel@ucw.cz
Cc:     lkp@intel.com, kbuild-all@lists.01.org,
        Amy Parker <apark0006@student.cerritos.edu>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] swap led_brightness from enum to typedef
Message-ID: <202107182031.tCn24oIk-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b5902665dcc4c0fca7546987303e348d8657f59.1626383424.git.apark0006@student.cerritos.edu>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0011.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::23)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by JNXP275CA0011.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23 via Frontend Transport; Mon, 19 Jul 2021 08:21:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5feb2bc2-340a-4962-7f36-08d94a8e48d9
X-MS-TrafficTypeDiagnostic: MWHPR10MB1951:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB1951BA2D0903390BEBCE764B8EE19@MWHPR10MB1951.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ojgaPuX8vy+eMUJE+yqmDdBC1YeoOh1Ph+mOKy/XxpyhAjseWqgCD62zmvvV6hzQ289yBRQg92ShkUZwKn0pUOo+hhq126ViAtOqKTWF/D6sPusdEIn8K0zzKg9oE0FTjktDez+oQb3XwxY3rbkPJSbkTUN8quisnHrSo3DdV3Vm5Rthl7ykNU4C4uqMWMsDRFwV5J76GoH7F/3WsNbFPxzUzlhpNnFIF/nqj53WrO3YF+YfneTyUWk8m9wMR8wGPr+vDUrw6wpfOnjOazdA826boeM0NE0+Nw2zvF/Fc6F0V2nkIdXIrTE04FO7YgU+a5ch9Ou/KrEEYZsi43VfdXlM66go2nLDTxA9CVRPvHFsjdN2f+gyaRMEmsx0EDgGxFNzg7EcOqbNgMx1r0EMgelg/9yGoafAkDKhMyWE9WSOdkC7pQ0D1aEVSpR1VKgTOWF92hLZWAzBxpfuSRWAvS7Lf5O8h34rL3QX+zL87npSVnBP4JfbsBrQOGCeV/B28xq8yR5ItBCVP/7jTL6Ryc7TnVf9LXpIErQ7MiyfUclBrZX5NkbeHzrrzokXuFBcjWloGP/NPUhawxk2lAtjQeq7cdK7jbMtlneUMiSKTUHAtvSFDofVpGfepWyREVNEu9B4X5wMcqVyqqU0wFFM6DFvpD3oOeOzls7VMp7toORTgrL9EstWJV6NxApcGE1I5LaLEJYcETPlaFFjqPxBl9uGkFj4xzua7UW2GxY2vI2c7KoEZOnuEL50Lw3wqD0nA9ia16rq8gfjqpWnSc95F4UFcrOIcN+jPv3TNqwLSdaM8Cf627cvXopQjMXZTpy4K8Jps+JPCeAmBsnyXv4NnA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(44832011)(186003)(956004)(8676002)(52116002)(86362001)(83380400001)(6486002)(316002)(8936002)(4326008)(26005)(5660300002)(6496006)(36756003)(38100700002)(508600001)(2906002)(66946007)(66476007)(1076003)(6666004)(9686003)(66556008)(966005)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HpQB1Z6nx/ZTaxnpaAIS2b+XILccTuh3vULLPh5kvjMEuz+sjbDL5wpaOY3h?=
 =?us-ascii?Q?8KWfWu/VDQipiB6fdYvHymv6vHaWy9PbOxGVpyZ/uceFX+y9yHc4u295TGbW?=
 =?us-ascii?Q?tmTzP9oCQk9FbhtMJR96eR0Xu/+lkfpPFrPhXETmNqqpEE88lFdJxbrk2mAu?=
 =?us-ascii?Q?vx4sJWv3teyz4WiS5+zXKG8ouZtTZN+E4Uw1DojvhM8+TxvpJgUwn6/H7m0T?=
 =?us-ascii?Q?i7JV3LA9X8IUfHdMIl5BBYEUf6EYrmMpWM5R9thrvQ5TVq5oDhkffv9NEVxV?=
 =?us-ascii?Q?5SiQ4+qKg6qsvr3zEmsCuXRY+KhgIR79Z3ODjg4noBBD0+0Eg/6G4ayyd/xD?=
 =?us-ascii?Q?wCjaRLDqmXGrY+y4pHdPHa8iqLKyeXzkM+mHKAvQRyw2JjeOn9gZ4dzMJg2k?=
 =?us-ascii?Q?8f5HwZVBwH5piopA0TZ0fv1d57O3PtRQ5nIURnDNeQS00Ys9CqGcBS9bPf1t?=
 =?us-ascii?Q?eBLvzRIjrqY6X5VDwUR8Ezj8/v0JA2rZ/+vnwHAPEYGJ6wpU0YoRCI+qqgng?=
 =?us-ascii?Q?3djqcOSUWjK5KVOxilGFnmBRXaasm9cY+1V1CQEmYkzFo5Dh7EU7bhgdtBW1?=
 =?us-ascii?Q?XHhe/G2djgf8jmc5sShcwbBQ/7er1H2qNMCjPsu5ehBV5UTFTGzRibsfISIC?=
 =?us-ascii?Q?CdDXiefhf4S/O6zhaEFhQTYRF3gVlK3Xep/6yxbdoJ3VfDUqnqF3X1n+/8I2?=
 =?us-ascii?Q?/o3KEJTE4zjRB7qwYAH6IOcryZ0KjvfBvL4fAXY4lDLO3Qh6RiehxiGIMv2+?=
 =?us-ascii?Q?siue/RJeUUbX6BkMJDuDjlli3n8zlATqVLn15qjBzNygsA2Lh75F3CDUrAnV?=
 =?us-ascii?Q?HtJQBDE+JfYjrreHEuOyQei3NVC95b8ubVgr5AM3WcVJjT/D6ln33Y961mIe?=
 =?us-ascii?Q?vzJmwv2ngVxrrg0+McPIq95HCa/22PzG2cc+1630O2wBUvX9SKnO1lgBrOqQ?=
 =?us-ascii?Q?4JiPbL9hhUpjfb97ZC430cD3ChtjNztRyo648o05UJMUK+EPxLr7xW7UvZyo?=
 =?us-ascii?Q?zayeSDIlGp2nPUtRiY1dv5XIXQfZqwGNA/aX5azDdUmJStc7SNYeL3AtjjSn?=
 =?us-ascii?Q?YKf7us3vBEjS0vqaQWH60AwRsJdmYEqxmYHGAQcnrHuFF8bq8ZGG4HyHue9H?=
 =?us-ascii?Q?EEMZ2Hg7aO94aKvjtXYY6U89OpOol2SpLFQS5E6yRP3z4KPb5iZu/uTxo27d?=
 =?us-ascii?Q?RgqpuU+/GXwx/GQqG0kfX4u62ANFrWsdBCy0wIc95vLEwSn/XGrfJ8HOAz8v?=
 =?us-ascii?Q?ZDkCtNp2TJZlpBzV8cSXJTvKhZxRnP8PUj47A+hJ1UCoG4eJFJiJ6JJnDobd?=
 =?us-ascii?Q?3zVXelNpLhH9J+EWHesJBvp7?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5feb2bc2-340a-4962-7f36-08d94a8e48d9
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 08:22:01.9359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bicKXkiAZ6pnEyJsWaalHMqQyEv30KwXSt/deEefHNNbhXwYLQwswumPbSQBuOFEdTBDre2BFuK9QP/ma9y6dUR1D94CmvPlpvc9TNq8E/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1951
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10049 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0 spamscore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107190045
X-Proofpoint-ORIG-GUID: WtvmaMW_hAMZziWIwfrRMDqdhzVG1AZ-
X-Proofpoint-GUID: WtvmaMW_hAMZziWIwfrRMDqdhzVG1AZ-
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Amy,

url:    https://github.com/0day-ci/linux/commits/Amy-Parker/leds-change-led_brightness-definition-from-enum-to-typedef/20210716-052140
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git dd9c7df94c1b23feacd54112f33ad95d93f64533
config: x86_64-randconfig-m001-20210718 (attached as .config)
compiler: gcc-10 (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/platform/chrome/cros_kbd_led_backlight.c:53 keyboard_led_get_brightness() warn: signedness bug returning '(-5)'
drivers/platform/x86/samsung-laptop.c:1124 kbd_led_set() warn: impossible condition '(value < 0) => (0-255 < 0)'

vim +53 drivers/platform/chrome/cros_kbd_led_backlight.c

b14a971f104520 Amy Parker 2021-07-15  42  static led_brightness
                                                 ^^^^^^^^^^^^^^

492ef7829d2d09 Simon Que  2016-03-08  43  keyboard_led_get_brightness(struct led_classdev *cdev)
492ef7829d2d09 Simon Que  2016-03-08  44  {
492ef7829d2d09 Simon Que  2016-03-08  45  	unsigned long long brightness;
492ef7829d2d09 Simon Que  2016-03-08  46  	acpi_status status;
492ef7829d2d09 Simon Que  2016-03-08  47  
492ef7829d2d09 Simon Que  2016-03-08  48  	status = acpi_evaluate_integer(NULL, ACPI_KEYBOARD_BACKLIGHT_READ,
492ef7829d2d09 Simon Que  2016-03-08  49  				       NULL, &brightness);
492ef7829d2d09 Simon Que  2016-03-08  50  	if (ACPI_FAILURE(status)) {
492ef7829d2d09 Simon Que  2016-03-08  51  		dev_err(cdev->dev, "Error getting keyboard LED value: %d\n",
492ef7829d2d09 Simon Que  2016-03-08  52  			status);
492ef7829d2d09 Simon Que  2016-03-08 @53  		return -EIO;
                                                        ^^^^^^^^^^^^
To be honest, I'm confused why we are changing this from an enum to a
typedef.  In the kernel we generally avoid typedefs where possible.
What's the problem that using a typedef fixes?

Also probably the name should end in a _t.

492ef7829d2d09 Simon Que  2016-03-08  54  	}
492ef7829d2d09 Simon Que  2016-03-08  55  
492ef7829d2d09 Simon Que  2016-03-08  56  	return brightness;
492ef7829d2d09 Simon Que  2016-03-08  57  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

