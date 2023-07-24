Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E041275EB3D
	for <lists+linux-leds@lfdr.de>; Mon, 24 Jul 2023 08:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbjGXGLQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 24 Jul 2023 02:11:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbjGXGLP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 24 Jul 2023 02:11:15 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2050.outbound.protection.outlook.com [40.107.7.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA25718E
        for <linux-leds@vger.kernel.org>; Sun, 23 Jul 2023 23:11:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jN0Z0pV1hndnHfvFRSHZpZU88qTh5puXZaJ9mhWj2PMB4yFuvjPBQXV+kVv5l4bYKxlj9CxWP8Gxg0yB+crTKpgQZz2aFU2aQax4t1Aqx5WptSUbkyWosDYu/Qy1JTyZIogvSNOBw1byrSD7OQA/X9i5j0Lna4opFQqRqs7wCBSp+hRZ+XFsHHQSG0idGEuEtJZUU8ut5RbZ57kZkCLL09Yhbex+6gvmdM3ygooxV3SRFF6hMnxLYsjnD5fjoaZPzD+qfSN2in4ehL4tMzDbxzcsIKkJ86vdRXZ7QCfx5Dpb2f1cZIbxMUU7bYHd9I4E9T0LhQXVVKOzQo4GDdcMyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRSJZPj4YvFWU3ajk2b0mMVtV0y4ypceVR170CMPoQ4=;
 b=OqXIYbBjFmxmD0xkznNaxIcn13q3ePoxe0okXc+u0Ac31RbQ2JqH6/gIExRj7VUnhyksw1YafVGBRtQB3OPVZa3Zu+LTtdPyaEAlFVW3lWthnTyEdcrIa7vT4VFgZngWoXJKhffwDlcoEa1ziGSZgobU8RjrBs2hTJwXOhEa8mblG/zGGbHmHD2777ZZMBNJaVepri5R+cCe5AgNXavbvPTfzwUgbkGFpJCMO1Wnjx4YxvCPXNNR1HMNk1TA8e8GV0t/K/NPBnxXEsVumSLmjdQ/x4BfL5FL75qcc2BhjAxCRhIh6dOMDcmZqNCbSfWyC6TLjl+1xgF1c5+bZBwxCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRSJZPj4YvFWU3ajk2b0mMVtV0y4ypceVR170CMPoQ4=;
 b=CEbiTztW0EKZ+jbP8y52ocvQUeDFND6sFfYe9MQZgxC94QUS5X9+0BAC+8pURh8Rdk+/p6s+yZWT3NYzBtcdwuYbIZGYX6Vo5YI0KDf4mSUBU6HCVuyV4zusbCIcf4WLBg7S3lTZsAaxhrNqukkNrxbxAlz3DkTVGjBbLHNizG0opw6vCbUBmVndpPyGHUTnGJhWpD6MITiXJegQtJEs5+qiovg2aldEkrTtIXUqJiPFnyybE5aVojDp2pHHtCNgTdrJ/0T5nhbRzjjV1jOiyc9CfH1YIsw0FR/KEecteTVdcw53J0CsEP184ZQ+UYzh6mO+CFtbh8el8PvsKn9IuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:269::8)
 by DU0PR10MB5703.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:310::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 06:11:11 +0000
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e66:8cbf:13f3:c61f]) by PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e66:8cbf:13f3:c61f%3]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 06:11:11 +0000
Date:   Mon, 24 Jul 2023 08:11:06 +0200
From:   Henning Schild <henning.schild@siemens.com>
To:     Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>,
        Tobias Schaffner <tobias.schaffner@siemens.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-leds@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] leds: simatic-ipc-leds-gpio: Convert to platform remove
 callback returning void
Message-ID: <20230724081106.7015e975@md1za8fc.ad001.siemens.net>
In-Reply-To: <20230724054743.310750-1-u.kleine-koenig@pengutronix.de>
References: <20230724054743.310750-1-u.kleine-koenig@pengutronix.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::18) To PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:269::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5780:EE_|DU0PR10MB5703:EE_
X-MS-Office365-Filtering-Correlation-Id: a210a3a4-f6df-46e5-3aa6-08db8c0cc6dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 25Ojx4mTTbL/aP0KuLHR5NGyOd9zleb1Al2M47Xgj/JFyItbh7jdqD9GTKaRR3T4BRLbXjqMjgTF+3Z5pgydtY80j8Xlu+PE+8K8EHAHqDwRsCfSHEUZVfhFsMCK94tXCC9cZvWNpTA48vXnYAU8gO1SOS+1HDA1gyEckeLB7YE+iHCabSZWAc5U6jj6PaB5UGYZmEEjRNNmY4K7Fygk4fCqzRV33kS+gBFeJ2kIPqTjNo3btsjloP2Z2obLzQoEu+Wg7SO18m3ARz4h7m7aFGz9BusLH187j0iTU7wsOOEPjr+kkaDNdzZ4iAypyWSXUfWQSbvljhnAjpN19rkn7N8w+hEuk6djAduwhVTbaZr7F/OS04mKmA0rTTz3NsMjW6RQCXZsyBsVr8JRCJmx0uRMbHYx/c7VXvwqXPwuYcckj030F/Z0Um7K1nKORJsx+aE2muriYBViYyCdlGcAEbewp7z7G7m47+Yucd8W60aQS0HIHGD6E1/PyuSjm7zZumy4IyPnM2J8ptwoHrwvJfM99/5S0+SR4YFzvQd5u6kEjOIHUCLGVus/aXnyxF1d
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(376002)(136003)(366004)(451199021)(38100700002)(83380400001)(44832011)(8676002)(8936002)(5660300002)(478600001)(54906003)(316002)(66556008)(66476007)(4326008)(6636002)(110136005)(66946007)(41300700001)(1076003)(186003)(6506007)(6486002)(9686003)(6512007)(66899021)(6666004)(2906002)(86362001)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTB3M0hZc29XZTR2OG04d05RbXZPcnNlOEFoWm10OElKM0pQUnhiKzR5K3RO?=
 =?utf-8?B?SlFubDhySThSckZaUEdMU01uSkVuOG1VTzZGQmxBQURHZ1JHb1VJLytqN2tL?=
 =?utf-8?B?RVJwd2o2akUxMm5ramd0T2xLYlFOVUlKZCsyVWQ1OU1Ud1lReWxEOUZ5bitq?=
 =?utf-8?B?MGdudHdySFV6RVFwc0p3K2NZd012VUoyT21NVy9NUG40Z1ByaExzS3E1dVRW?=
 =?utf-8?B?UlFSMVg0a3ExMklhcVlXNGRNbXFjQ1dwMDBZSkhHMGpET1R2eU45VS9pekxR?=
 =?utf-8?B?aFFCOUs2Y2x2T2g4bVBjZElLdU1FSFU5eUtYU282VWpZTWxSSWM3NVYwdG84?=
 =?utf-8?B?cXpPMnVYMjBlMFhudlN3Zll0TXZUeWVCSUpxL3hkVEhtbURGZE1KWkthLzNK?=
 =?utf-8?B?SG9FM1hOMVZFK1hsM1o1MGJIdlRGTVF4TXdJTU9IWkZNSHIxeEIwK3B0VUtB?=
 =?utf-8?B?R2hvcm5UMmEzTDIrdkZWUFc1YVV1UkJTblBBNnVtOXRrLzJXcnRpOHJkOVlY?=
 =?utf-8?B?OVVUZ0JFcWpnbVRRalRIcnF3bVVLYjBxUm9HRzg2b1FrWVdzRmU2T1RwcWQ1?=
 =?utf-8?B?VzlBU1hWWTQ3eHhtdmpXRUo2S1hVWlQ0S2h6Q3JyR2h1WHZScHIxRy9iYm53?=
 =?utf-8?B?aEZLcWtsbFBlVDU2L3VRV29wcXhaQUdVaVlwanE3ZkNyZUNNZFFLZGlLTHV3?=
 =?utf-8?B?NlNLNUZhaVIwancwTHNjMnFuOGR1SUhzSTc5Nm5QU3MyNmxjcU9ib0VsZ3Nq?=
 =?utf-8?B?SWFIOUpFd3JYOC9OY09FMWtlc0Y5eUVSdmIrY3FLam1CT3FqSVZmTjlvcnRy?=
 =?utf-8?B?bkhWUVF2L0N3VnJnYmNIQXZPRWZsY2JIOEJTQ01vemhBaUg5Z3BMTENQZmNo?=
 =?utf-8?B?dnNIdVpybEw2bnViQVRTbEpaRzdtM0k2dmdiSHJodENuRjhQbUp2dk56VXRx?=
 =?utf-8?B?cSs3a0w4MGtFWkhtQlorZFowSWRNUnFVRTNlQUVZZXU1L0l2dSt2TlNETFVU?=
 =?utf-8?B?SW1PRHBMVVVPeDJrbjZOY0t0UjJUVzhWQ2p3bktsbndCSXVTVURLblN1b2xU?=
 =?utf-8?B?N0RTTUxkb3hWa3lDMFg4dHZYRzFIWUVzSGQzeHc1WGxJUVVoMEh2YVp4SWpy?=
 =?utf-8?B?MmcxNzhudmxUeVhWeDJZMzdyTzhwR3liSUdORHcyZnNiOVpVTSsvU0VqeDc1?=
 =?utf-8?B?bTRHQ0ZtUm55WWorUjArbDJ1RFc0eHY1TzVYQ3lXbnUrTGthRjZXYnFURmJ2?=
 =?utf-8?B?dGNKZ0w3YnBYS25lKzhMSmhrQ3dNUnQ2U3VpZGI3YlNkZlZ5WU81QmZFQW9E?=
 =?utf-8?B?VTlIMTVPa1VtcnRMYWd1NVcycnA2MlgrZ3NjbGExQTQyRFQwdkRRTVdlUUNa?=
 =?utf-8?B?ZDlMelNGQ1Q2YXdvTTNuNlY2TXRoaGtaZEt5R1liQVQ3Y1Y0VW9yOWtTNUVE?=
 =?utf-8?B?MnUyVFNURWZ2b3RwU2MwWjFvS010NS9RNzZRMWJ6NTA1c2pLVTdxWmllT3ht?=
 =?utf-8?B?N2EvbTFRYXdVYnAvVGtFN0wyZUQ0U1FwaGlwSmI3djN4dlhsVFF4b0tGMWd1?=
 =?utf-8?B?bEt5UUdtSlN3eDNScmw5ZHk3aUswTzZSL055TWpQMDFJRnplemQ0STVKNEV6?=
 =?utf-8?B?U1FiMGJPSGpJY25CSXpVc2NGK2F6L1MrVkJlTElQU1U1bWE2c0d2c3NDbHhB?=
 =?utf-8?B?YnE2YkU5Ui9TU3ZUaDJWRmx2TUMrMnZtYXBLM1VZWEh0cmoraUMxeGk2cTJt?=
 =?utf-8?B?b2JFU1g5bm5OeitiTEMzK2pwZWJjMXBnWXRITUtWa2ZwNEVPT1diQXY0S0w1?=
 =?utf-8?B?Q2RVRHFpektGNnA0UGVHNmd6V1FPMkNvU3pSN1pOb3laVXpvNW9VcG5nWnMz?=
 =?utf-8?B?SEhReCtqSC80bDJSa0x5RUVKNmlEUUt1QnkyNVFmeng1Y0Joc0kvQXdtTEEz?=
 =?utf-8?B?ZlllSElRVUVpTDVQSHoxKzRHTVdoRElzOFdaWWdtYmMvZXh3Z1VoMUlvREFl?=
 =?utf-8?B?NTdINk9CcHJWT3luOG9Ud2UrMTdDMEp3K3c0R3lsQi9UVHg1VGl6RXF0Uk9P?=
 =?utf-8?B?NHIrWW5ocUVNNWpYem5yNWFyQVdWcTFBaU80YjhxVUF1Uk80WUVDRk01ZE53?=
 =?utf-8?B?cmpEMjFER1U5T0xLN2p2MG51bVNaYzlIYWNPQ1RFSng5anV0TEk5WWJiYzhl?=
 =?utf-8?B?MEIwWkdYYktBNmdrS2FlRE94bnpXWEhVZUw1NVdMTFBNQjI0Z29LZ2ZHdkpL?=
 =?utf-8?B?WERjS0NWc0FWazRSa3VUY0VCcy9RPT0=?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a210a3a4-f6df-46e5-3aa6-08db8c0cc6dd
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 06:11:10.8902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TDPLVXb5wMQ784QCASTlHfnEfHxPWC9K9sRsCzsnU/AV+ns8Li03HG5KakwK52JeSUJzR+b+k0WrMw2xs20xS3NL3FADeqGdX4xfh2k+dW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5703
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Am Mon, 24 Jul 2023 07:47:43 +0200
schrieb Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>:

> The .remove() callback for a platform driver returns an int which
> makes many driver authors wrongly assume it's possible to do error
> handling by returning an error code. However the value returned is
> (mostly) ignored and this typically results in resource leaks. To
> improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void.
>=20
> Make simatic_ipc_leds_gpio_remove() return void instead of returning
> zero unconditionally. After that the two remove callbacks were trivial
> to convert to return void, too.

Thanks for taking care of that. There are currently two+ patch qs in
flight that would conflict with that, or rather need that done as well.

1.
is the introduction of a CMOS battery monitoring driver which can
be found in (using the same pattern but in pdx86)

git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.gi=
t
tags/ib-pdx86-simatic-v6.6

and was sent as "platform/x86: add CMOS battery monitoring for simatic
IPCs"

in fact plus "[PATCH v2 0/3] platform/x86: move simatic drivers into
subdir"

2.
And the other one is the introduction of a new board in the GPIO LEDs,
sent as "[PATCH v2 2/2] leds: simatic-ipc-leds-gpio: add Elkhart Lake
version".

If you just want to deal with LEDs you should rebase on the latter. But
since that is based on the first, might as well do both.

Or we wait until all those are merged, you try that conversion later or
Tobias will take it.

regards,
Henning

> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/leds/simple/simatic-ipc-leds-gpio-apollolake.c | 8 ++++----
>  drivers/leds/simple/simatic-ipc-leds-gpio-core.c       | 4 +---
>  drivers/leds/simple/simatic-ipc-leds-gpio-f7188x.c     | 8 ++++----
>  drivers/leds/simple/simatic-ipc-leds-gpio.h            | 6 +++---
>  4 files changed, 12 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/leds/simple/simatic-ipc-leds-gpio-apollolake.c
> b/drivers/leds/simple/simatic-ipc-leds-gpio-apollolake.c index
> e1c712729dcf..4183ee71fcce 100644 ---
> a/drivers/leds/simple/simatic-ipc-leds-gpio-apollolake.c +++
> b/drivers/leds/simple/simatic-ipc-leds-gpio-apollolake.c @@ -45,15
> +45,15 @@ static int simatic_ipc_leds_gpio_apollolake_probe(struct
> platform_device *pdev) &simatic_ipc_led_gpio_table_extra); }
> =20
> -static int simatic_ipc_leds_gpio_apollolake_remove(struct
> platform_device *pdev) +static void
> simatic_ipc_leds_gpio_apollolake_remove(struct platform_device *pdev)
> {
> -	return simatic_ipc_leds_gpio_remove(pdev,
> &simatic_ipc_led_gpio_table,
> -
> &simatic_ipc_led_gpio_table_extra);
> +	simatic_ipc_leds_gpio_remove(pdev,
> &simatic_ipc_led_gpio_table,
> +
> &simatic_ipc_led_gpio_table_extra); }
> =20
>  static struct platform_driver simatic_ipc_led_gpio_apollolake_driver
> =3D { .probe =3D simatic_ipc_leds_gpio_apollolake_probe,
> -	.remove =3D simatic_ipc_leds_gpio_apollolake_remove,
> +	.remove_new =3D simatic_ipc_leds_gpio_apollolake_remove,
>  	.driver =3D {
>  		.name =3D KBUILD_MODNAME,
>  	},
> diff --git a/drivers/leds/simple/simatic-ipc-leds-gpio-core.c
> b/drivers/leds/simple/simatic-ipc-leds-gpio-core.c index
> 2a21b663df87..32a753e5c7b6 100644 ---
> a/drivers/leds/simple/simatic-ipc-leds-gpio-core.c +++
> b/drivers/leds/simple/simatic-ipc-leds-gpio-core.c @@ -33,15 +33,13
> @@ static const struct gpio_led_platform_data
> simatic_ipc_gpio_leds_pdata =3D { .leds		=3D
> simatic_ipc_gpio_leds, };=20
> -int simatic_ipc_leds_gpio_remove(struct platform_device *pdev,
> +void simatic_ipc_leds_gpio_remove(struct platform_device *pdev,
>  				 struct gpiod_lookup_table *table,
>  				 struct gpiod_lookup_table
> *table_extra) {
>  	gpiod_remove_lookup_table(table);
>  	gpiod_remove_lookup_table(table_extra);
>  	platform_device_unregister(simatic_leds_pdev);
> -
> -	return 0;
>  }
>  EXPORT_SYMBOL_GPL(simatic_ipc_leds_gpio_remove);
> =20
> diff --git a/drivers/leds/simple/simatic-ipc-leds-gpio-f7188x.c
> b/drivers/leds/simple/simatic-ipc-leds-gpio-f7188x.c index
> 583a6b6c7c22..c7c3a1f986e6 100644 ---
> a/drivers/leds/simple/simatic-ipc-leds-gpio-f7188x.c +++
> b/drivers/leds/simple/simatic-ipc-leds-gpio-f7188x.c @@ -45,15 +45,15
> @@ static int simatic_ipc_leds_gpio_f7188x_probe(struct
> platform_device *pdev) &simatic_ipc_led_gpio_table_extra); }
> =20
> -static int simatic_ipc_leds_gpio_f7188x_remove(struct
> platform_device *pdev) +static void
> simatic_ipc_leds_gpio_f7188x_remove(struct platform_device *pdev) {
> -	return simatic_ipc_leds_gpio_remove(pdev,
> &simatic_ipc_led_gpio_table,
> -
> &simatic_ipc_led_gpio_table_extra);
> +	simatic_ipc_leds_gpio_remove(pdev,
> &simatic_ipc_led_gpio_table,
> +
> &simatic_ipc_led_gpio_table_extra); }
> =20
>  static struct platform_driver simatic_ipc_led_gpio_driver =3D {
>  	.probe =3D simatic_ipc_leds_gpio_f7188x_probe,
> -	.remove =3D simatic_ipc_leds_gpio_f7188x_remove,
> +	.remove_new =3D simatic_ipc_leds_gpio_f7188x_remove,
>  	.driver =3D {
>  		.name =3D KBUILD_MODNAME,
>  	},
> diff --git a/drivers/leds/simple/simatic-ipc-leds-gpio.h
> b/drivers/leds/simple/simatic-ipc-leds-gpio.h index
> bf258c32f83d..af7384c37e67 100644 ---
> a/drivers/leds/simple/simatic-ipc-leds-gpio.h +++
> b/drivers/leds/simple/simatic-ipc-leds-gpio.h @@ -15,8 +15,8 @@ int
> simatic_ipc_leds_gpio_probe(struct platform_device *pdev, struct
> gpiod_lookup_table *table, struct gpiod_lookup_table *table_extra);
> =20
> -int simatic_ipc_leds_gpio_remove(struct platform_device *pdev,
> -				 struct gpiod_lookup_table *table,
> -				 struct gpiod_lookup_table
> *table_extra); +void simatic_ipc_leds_gpio_remove(struct
> platform_device *pdev,
> +				  struct gpiod_lookup_table *table,
> +				  struct gpiod_lookup_table
> *table_extra);=20
>  #endif /* _SIMATIC_IPC_LEDS_GPIO_H */
>=20
> base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5

