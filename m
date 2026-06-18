Return-Path: <linux-leds+bounces-8678-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NyBpFA5XNGpUVQYAu9opvQ
	(envelope-from <linux-leds+bounces-8678-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 22:37:34 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1056A2975
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 22:37:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=rZCxxnsk;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8678-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8678-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69C8C304C885
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 20:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED25730DD11;
	Thu, 18 Jun 2026 20:34:31 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazolkn19012014.outbound.protection.outlook.com [52.103.32.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6282C2F8E88;
	Thu, 18 Jun 2026 20:34:30 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781814871; cv=fail; b=r5dWxnf6k8lph/UI7CNrCfq/pr2IzI6enaKcooAuKJSixZfkEB8XSJnRmB8AhrPcjJfsh/w6otvDaT+cWg/69h1q6OOMtTXwIlyBlNtn/wDGHqCAeRtq1Wb8vb9GehcYZwWQFnUHl+iJFlQpH+TQ4CQcjuaUfX4wLpz4nA/sFbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781814871; c=relaxed/simple;
	bh=BSeAlxV7CdXRg/WlhRdlHqc7HwcPPUfE7XONYXpCMuI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E7V+Hi+CEtQmIa/ZXsaBci1UecIk4T9CabMSDEACbnkdpcRZHDVmK91wWG3W18eTmkUOU5Hrp3r+fyIMdPhb27VFsqutcgMeuXwGR7ZLnvGXc+KcyWNvOUmlJeul7ZuIaIqQmW4K/FjMZ9tBwfcNFoE0qYkCFOlX590NHV+ipK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=rZCxxnsk; arc=fail smtp.client-ip=52.103.32.14
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kRgg+JNRf+r4M6cjSB0FM1sLqKXNDvIysYd4UqtdcF04hoL2tyQrKL43TJtMxE4SzHu3uV1K7P3MY+Q1i3H8kvTmCtZrMW4Amy3mqSzw1OXleTEi8YUIPM8C++2PHduIddR1HuTMANYfZHVXYv1lcunAYk8sQFnVihr20YnNwsAZsrCs5LMw5RsuhZRc3Uc8JIlP38JLaXaP+UqAv9MRwmhTHj6hqpwhswCoKG2uaPStSXJCBgWXl4GDPubP4kM7PmymNfV8yivOxL7bLchzfh1FQhNzNcXQp/4KhWIwWuRgR9yXhPlfvLZVBlavF1d+rVbIRE/88jlCR9kG0TFAEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFZXwnbdSXfbZ651Yy8wqhfBjgSAGbZ7SQaQu6l459E=;
 b=Ev4RTTFwug8DoN9OsRZvcu3gDBGvxrS7tyYYSjsgqzDmaUN4fXNH1mLivxMgLcQRZGWUMSivtUoBoswbvUwuCRlyjtcdW3JL0tJqHWENg5MdZO9eO1pbhiiKiFZwzMWBhzyOdtIT0kck99N7tRj6hYhywd1eftkrHFK5vkDulETkoXjFHRbWsoNkXK7qGSIH7VpkCBkC2V+iJxHl6lau9LHuohZEJtvozDikLuljiZjUK1xpVf/BxY7oHhw5/06jt2E8iuFVg2jtltt/tf+QXLlVEq1Ccp6hcitIfRMt5TaH1ubs/3bx0ZzB2FxIRimsvWgvQag8lpcRtYcG5b3+og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFZXwnbdSXfbZ651Yy8wqhfBjgSAGbZ7SQaQu6l459E=;
 b=rZCxxnskjYadKyItVEV8GUQEuhk2k/cVxpMOu7O5hOYCm0HrrKsV4ftpU5IuZIt2TrgYeQeH8hc6HEnwJ6YW6Lnk0WU5+5dNmpEAsdlgZaPSGItYCBgHuWOgRCD/ZJAxp4eN3/ey6jFZaliUVZjZ1cTCA76sCfN34oaq5JqJQliojqRKmCwWuHVUyVvAReZrhBw6ttLYwPuyNfmz8U4gqfa8BEvl9/KAD31tUj1UG4P5Dbv5SIYzmrGmzSVw0+7FjnP+nYKj7Gg54QDUDLh6RWPPNzS47KskmiPb64OAKCNv3NfDYCATDB79U01AU1cIfM/cm0NyW0jXfqrbd6t5ug==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by PA6PR08MB10545.eurprd08.prod.outlook.com (2603:10a6:102:3d3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Thu, 18 Jun
 2026 20:34:26 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 20:34:26 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/9] leds: st1202: fix pattern duration prescaler and pattern_clear skip marker
Date: Thu, 18 Jun 2026 21:34:14 +0100
Message-ID:
 <GV1PR08MB84973D297B6BD8DAAC15B55BC5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <GV1PR08MB8497ABC8E6AEFF8AAA1AF883C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497ABC8E6AEFF8AAA1AF883C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0017.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::22) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260618203414.3310714-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|PA6PR08MB10545:EE_
X-MS-Office365-Filtering-Correlation-Id: 85e598f4-801a-4392-10bc-08decd78fd41
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrO+2YmbT5jW+WUSUt4IT5vRf5AAVJ8TXpyQr/QWRq95q92v6FsDIMLk5+MgnA4gCbhSRev3i4YPaefdA1g5Qtbe7wVw86SOCpdAe1DMlDQH44aAtJF0WsshatB+FR92h2j65yAA7r6LlVr9eDIbvaAHGVCu7EXoy7JxoR6/UhQ7nJFzhXFn48OxmwDWV8HcP6ht2+xjRkiGlV8AO3nfIkFxdSmuz5Rh3sZSe69m+cz3rH9XRQXnXmZeodw/wW8aelyQDN+PaNyYWnX8Nh1Hzh3IRmrISsImJiRsSMjmO+WMhYSwQ834wX5T+GM1mIRce3XOoGxjaz+AhUMsog1/1RYN+Wg8XpEmlp5WxquREzLanh2Mmgvv0Mib/cucyJgfXbTzhSqqR8GhejlksF5Mz+KeGDx+fJfkpIlZFT9nkdYiqmVMTS1UOKbsp8SgGgzS3y8Hf+a6VynYZ4MbIu4gsLSPPKV208efuIcWSmm3VuO+LAKLVptQTN5SU9Qwc5p2YkW3Ljaz67d2ciNMj0ubmymQS7FaSX/fdz/gK4M3aLrDjYm5Z+bJJ+2PiRoODZBA606bRkgJngO2Sx72u62Yq9TkgU0YNsnsIkrogsLAqdP+rTumRZGHCy884FIRn05tft9/tQzdTvs2vd8Ea43OiBaiyidvbDBRyxDemZWVwjq3sclLp7CxmLcxo/p9PvnoVJI/YznxnP8BNT7VRl909EtymAipaGrARDeJIouHHKiED79Ep8TpqqN8QrHqUBImkKY=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|6090799003|5072599009|8060799015|41001999006|15080799012|23021999003|37011999003|19110799012|51005399006|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NnBrcVVKMnJLVndFSnRydDl0aWF3b3FvU0tLcDFMVVRkNzlHNlVEVWk4UUJh?=
 =?utf-8?B?VEJ1aVhpNFhkVkNuWlBYbnk1RzBoS0ZIZm9KVmkrVmlTTndjMnZCOVZUSXZW?=
 =?utf-8?B?ZXBFNDhmb2M0RHM1bVdpV1E5NUxFNGM5T3N2TEdzNVAxbmNZZkJPb1ExT0Va?=
 =?utf-8?B?Sm0vMnVQQk5DV0xMTFJlbEZ6YlFhYkZRSkxqZ0VKbGpuY1BMUlBJejZTMWRq?=
 =?utf-8?B?dmpRcGRZU05OdVlJS3pxWWNGNTA1dVBSbUY0SDJqMDZlTXIvNzZWR3MrWjdO?=
 =?utf-8?B?L0VGRitNajIyWVhKUUs0MnRINk90czUrWHlkRjd1YTFJRFpOQkN3SUNPUThr?=
 =?utf-8?B?VnNYVElrbGVpOFF4bWFsU3dMNlJlQjlFNWM4bDZVNFNQcjU4UG1FVFVveEtr?=
 =?utf-8?B?YjVFcGdscGNmeFBkd2lVS0lnZlVCSUF2QlJ6dXlwNVlESy92anBnWi8rR3Bo?=
 =?utf-8?B?dVVSbllYZHA5QmdCWE15WFliVW5XWGxwL08yQjllQXRtN1d4SnhRY3FiWkRQ?=
 =?utf-8?B?amdCQnNnK3VoYWhxTXVTNSt2cTMxbzlmNE5IS2UxNWN1dktycml6VW5uQkZ2?=
 =?utf-8?B?NTZsRWJpeGNSNkErMWZJTTNVT1gwZHBoVzY1b2pkakVvZWtpMXgwMHpPS2t4?=
 =?utf-8?B?eVNvdmdiU0xvbUVwVmRpbnJic1J1UldSelJxT25PZDc1VGgzUkZkbWY2WHpU?=
 =?utf-8?B?OGFBSldwY2k5U2tYbFJQV3FrVjg5MDhPQVUrUzlKelhORWNoS3JtYmhzaGtm?=
 =?utf-8?B?T2FEcUlzYUJxMDlQV3NPRFIyK3JXUlRici9mR25jMWJ4Q0dqV3dEaFpDRURY?=
 =?utf-8?B?K1ZvL1puaWlkMXU1NG9sNDRZRlAramZVcGVQVk04LzNJeU9yaGx1U0dTRHFX?=
 =?utf-8?B?Qm1Td09jK1NWa2dLbXVMU29CTXl3ajR6c0VXQVNoTmR2WGlmbk1nTit6aWVZ?=
 =?utf-8?B?bWg2S09sQUVOejVmak9YQ24vTGhCUUtiWHh2SjRKRkhVemQ3SXhQblRNVkRL?=
 =?utf-8?B?Q0JIRGZWeHpORmtYVDRaaWl0ZkhCc1hvMTB1MW1BQ0IyNlluWkp1MEFzdmF0?=
 =?utf-8?B?NWVkRDNRekxJZXVNbHpxS3VRVmEvZmllTk1lbngvR1NqSVEzekJCbGtrUlRK?=
 =?utf-8?B?Y1lIYVFpa0EzWTV5Y292d1k1M3c2TWh5M2ViMHJxZ3hkZW4rc3hiU3I1Z0xP?=
 =?utf-8?B?YlhhUDdBUHNOengxNmpZcE9Ia0VrYVkrVlhZWUJBaDBYN3FJSGMrQ2V0c0Fo?=
 =?utf-8?B?SW1lcEE3MUR0eU1teWRlcEE1eVkrZS9sOUNNZHZKb2hTQ20rN2lYdit1OFNr?=
 =?utf-8?B?bnVWV2FtWG0zSU9heG5wYjdKdFBNQmQ1bUZRVzljdUZuWFdDdmVFRVlWSGYv?=
 =?utf-8?Q?mnDlcs9iG8v7rwVGV4bYQ1ZcJ5bStk6A=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eStVQzZsTWpaQzZsMXErZWV3Z0JmeDZwYVJDeFE1SE81Uk9JZk9EblVSMzZJ?=
 =?utf-8?B?a0creElJcGZSOXVCMlM4a04xbXV1MW9PRjFac2JLeEp4VTkxY2ZQVSsxTmJq?=
 =?utf-8?B?QVdmUHpMREgyZFByL3N4aXFQN2xJWUdjZWFndFR4Q3hLdDEvblp5MXZxUXlv?=
 =?utf-8?B?NlQ4TmhhbGQ3U3FVNUxaNDJkT0pSejNtV2RPVnFSVmFHbVozL0cyRUV1WWxr?=
 =?utf-8?B?TGsrR05SVWFDdlM0YmRybzR4cGM3MHd0b1N3MmxNUmFjWVRUdlVlTUhNWTc2?=
 =?utf-8?B?bUZvUVNHUGpNblJXSnNERGtTMFY1d1RBeTJBaGVjdW5ObUxWcVlaVUVPN09R?=
 =?utf-8?B?aFNkbmozd1RWN1cxMWxJcHpYZUNHdW1STVVXSHBTbE9pZGhoajRLSWR2c3ky?=
 =?utf-8?B?cDdvSVVpbkRDb3l5WmN6M1BmREh5TDVZSk8vK1hQbzdlczBFTzdTM1p4cjNZ?=
 =?utf-8?B?cGNvb0psOXIzUzVseGtGOUtCdmR3MEZQZ1BkTGt5TmUrMGYrT2d2UWNiK0Rr?=
 =?utf-8?B?TEJNc0w4LzFjL2Q5cG1QeHZmSkFiMTE1OVN2QlBjMUMzVzNMYzJncnh4L3da?=
 =?utf-8?B?cDBUNTdtSjNtUEZLc2QzeGwrZkgzUkI0YXhmbUtQUFk5M2JhcXlwL3JXZ2dX?=
 =?utf-8?B?VlI4c3BIdUY5RDA4Rm1oWjR5U0tOaEVHeGZ0Q2JrQ0lzTXVJRmJPWkV5eC9Q?=
 =?utf-8?B?ckdOdFNTMFB0VmY2dWhrV2xqckpYTXFPUUg0Tm5qTkREa0hYdnlvY0hReWFO?=
 =?utf-8?B?cGJtZmFhbW85eHZWcFJVNnpGVnQ2RHltZ0ZLN0p6bkt3RWloQytwQ2MwS0ZU?=
 =?utf-8?B?WmY5RVMrR2J2ZnowMXM0eTBWZWhwVkV5Yjh2alc5ajNGU3JlUDdndHMydkR6?=
 =?utf-8?B?V3F2YzZRT0oyUDRBS3lMZlJPQTZ2NW41RjZjT0N2YXJ3YmxmdnJsYkJMWXpQ?=
 =?utf-8?B?SG16c1JvbDJ5NmxvRHcrdWlFQkYzdHYrWkg5YytnckxTczhTUjVteGxXTitU?=
 =?utf-8?B?b2MwUnpySDFIM2NraXRaS1NZYmxyL0I3WEJoV2t0djJ5L2V4YnQ0UlU5aVJv?=
 =?utf-8?B?RjM4ZDRObzltVHJ0SWsvdjQzTVFIUWdzUWpWZ2NEQzhFaitXUnByUW13cllQ?=
 =?utf-8?B?WS96Lzh3OTJGRHRXQW53QS80Zy9lODcyaFB4d0xiWWJ6ZjViK09BOWFhK0FG?=
 =?utf-8?B?SHlLMVJ1QkpqSUZvSmZFeDJLWldZekVUNWt2cHo0VGVlUnZNaGZoN0hQamU1?=
 =?utf-8?B?VnNVRmdEclp3aUJDbFErczB1M3pUdXlyVzdDNHRyVXlhSy9RYm9RbkZPZmln?=
 =?utf-8?B?WnZENDRhSFNZdjhTTTB2WEk1VmJlUnZ5NmYrcnd2NUZrY2h4VkpNWWZIRHZE?=
 =?utf-8?B?a0hLQ2trVzdsYmo3TjlnbFdLelJTaWpycm9BMmZLWmdJUWwxSEEzNGNsTVFG?=
 =?utf-8?B?cUxvZmUwalJtL1Q3WUorVkhnbjUwUTlOUDRaMko3NFV0ME5CUXgrdzRINXhY?=
 =?utf-8?B?bTk5ektsNElEOXlIOEg5RDVOQUtwd1Z5U2VSOEdUNXVXZHBhY0JYZXNGVlJz?=
 =?utf-8?B?cmVxei9WQVBQdjZGdjJXckdnMmtIWXh0T3pJbnFyRU9DcVNZM0xkQ2Q4RHUw?=
 =?utf-8?B?THgzdUdHUTZLNzByVTZtTytXUjdoTlN1RW1VcWZ4Y0ErMkNTSnBRMXFWR3NL?=
 =?utf-8?B?dndlUWJzVmgvR3JhdjR0MGRLeUwzK0laRE05VnNxNkR3VmtPVGM3dkl3bmJy?=
 =?utf-8?B?UEYrc1NoZWI3NkMxV3FwZHRRamxKNnN5YWxoNVhCdmxEdXdvTFAvcFNCUEpJ?=
 =?utf-8?B?Und2bnZadFAyL0FvU2gwcFl3aWVwTzk1ZXhNWVUvOXgxbUVaNVJscVZZYm9W?=
 =?utf-8?B?cWRSaEpkd1NsYjBoTjNrZmd2UzNBZWpyeGJxUU9YT2t4c2pZSXVnTUNrY3Bu?=
 =?utf-8?Q?lqqtv1WmSNJPAcw7QdOv2yWt5kmlB12o?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85e598f4-801a-4392-10bc-08decd78fd41
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 20:34:26.4602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10545
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8678-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:vicentiu.galanopulo@remote-tech.co.uk,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	FORGED_SENDER(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[outlook.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,GV1PR08MB8497.eurprd08.prod.outlook.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,outlook.com:dkim,outlook.com:email,outlook.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C1056A2975

The PATy_DUR register encodes duration as N × 22.2 ms, with register
value 0 reserved as a pattern skip indicator (§7.10). The driver
incorrectly subtracted 1 from the register value:

  value / ST1202_MILLIS_PATTERN_DUR_MIN - 1

This caused two problems:

  - All programmed durations were off by one step (~22 ms too short).
  - Writing the minimum duration (22 ms) produced register value 0,
    silently skipping the pattern step instead of setting a 22 ms
    duration.

The maximum duration constant was also wrong at 5660 ms. The 8-bit
register saturates at 255, giving a maximum of 5610 ms (22 ms × 255).
Values above 5653 ms were already producing a uint8_t overflow and
writing 0 to the hardware.

Fix the formula by removing the erroneous subtraction, and derive the
maximum from the register width so the relationship is explicit. Update
the documentation to reflect the correct maximum.

This exposes a secondary issue: pattern_clear() was calling
st1202_duration_pattern_write() with ST1202_MILLIS_PATTERN_DUR_MIN to
reset unused slots, accidentally relying on the broken formula to
produce register value 0. With the corrected formula, the same call
writes 0x01 (22 ms), leaving unused slots as valid 22 ms zero-PWM
steps and making the LED appear off for 7 × 22 ms out of every cycle.

Write 0 directly to the duration registers in pattern_clear() so unused
slots are always explicitly marked as skip, independently of the
conversion formula.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 Documentation/leds/leds-st1202.rst | 2 +-
 drivers/leds/leds-st1202.c         | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/leds/leds-st1202.rst b/Documentation/leds/leds-st1202.rst
index 1a09fbfcedcf..a2353549469e 100644
--- a/Documentation/leds/leds-st1202.rst
+++ b/Documentation/leds/leds-st1202.rst
@@ -17,7 +17,7 @@ To be compatible with the hardware pattern format, maximum 8 tuples of
 brightness (PWM) and duration must be written to hw_pattern.
 
 - Min pattern duration: 22 ms
-- Max pattern duration: 5660 ms
+- Max pattern duration: 5610 ms
 
 The format of the hardware pattern values should be:
 "brightness duration brightness duration ..."
diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index a750c95ef3f8..b4adade49898 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -31,7 +31,7 @@
 #define ST1202_ILED_REG0                   0x09
 #define ST1202_MAX_LEDS                    12
 #define ST1202_MAX_PATTERNS                8
-#define ST1202_MILLIS_PATTERN_DUR_MAX      5660
+#define ST1202_MILLIS_PATTERN_DUR_MAX      (ST1202_MILLIS_PATTERN_DUR_MIN * U8_MAX)
 #define ST1202_MILLIS_PATTERN_DUR_MIN      22
 #define ST1202_PATTERN_DUR                 0x16
 #define ST1202_PATTERN_PWM                 0x1E
@@ -85,7 +85,7 @@ static int st1202_write_reg(struct st1202_chip *chip, int reg, uint8_t val)
 
 static uint8_t st1202_prescalar_to_miliseconds(unsigned int value)
 {
-	return value / ST1202_MILLIS_PATTERN_DUR_MIN - 1;
+	return value / ST1202_MILLIS_PATTERN_DUR_MIN;
 }
 
 static int st1202_pwm_pattern_write(struct st1202_chip *chip, int led_num,
@@ -209,7 +209,7 @@ static int st1202_led_pattern_clear(struct led_classdev *ldev)
 		if (ret != 0)
 			return ret;
 
-		ret = st1202_duration_pattern_write(chip, patt, ST1202_MILLIS_PATTERN_DUR_MIN);
+		ret = st1202_write_reg(chip, ST1202_PATTERN_DUR + patt, 0);
 		if (ret != 0)
 			return ret;
 	}
-- 
2.54.0


