Return-Path: <linux-leds+bounces-8882-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w4n0FZrmRmo2fQsAu9opvQ
	(envelope-from <linux-leds+bounces-8882-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 00:30:50 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 803DC6FD341
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 00:30:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=F64nFylM;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8882-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8882-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 481AC303FB96
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 22:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDB6C38D3E6;
	Thu,  2 Jul 2026 22:29:58 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazolkn19010021.outbound.protection.outlook.com [52.103.33.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2827E3C108E;
	Thu,  2 Jul 2026 22:29:54 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783031398; cv=fail; b=lXbN1iYkqkbVa/aimFmYh2APFyy1Vq8663iRtKCTqc60uN9cxHIu985eZXGKfDOYNnbpseTosSW1jOfHjWlPhY3rdFHTCl71/9SgERtuCiLqnW6LzH1zR0KFfdZVVqTe6zLBWtP+JRQwcnOs7gPp86HDNB42J6Djwx4aaVCBX2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783031398; c=relaxed/simple;
	bh=y6ZriouCkezk/WIbS1eWC+nHIUnBDRkSrfHoLsJCKcQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aHJKNnMnSpD58X5bxWw9AO4gqNEfwtf8CE8Wa4Z33BCiEjtO+9Dff2hyCXQbwoanYhqsisL2Yl/nybwh1SVbzYiHEDdmzJrb/aylGySxBXPyWDHSqL6dV9fg85dqBZCYpaPXZxklTg5tM90rqSwcgKrFbkqNxuIFVw2d6HdOuxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=F64nFylM; arc=fail smtp.client-ip=52.103.33.21
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MthQHIPo2FhtRKZCqrEJZH7j6MfRCibljQ+SKpmnPA9Q5DmOHRX7HZKhPSMB07XBnQcudpE6N5y0a6/BqnHqHLgKGXcjrnswJS/eyx4iBTVFOQYBnpC1oJdLQ/fGY2o1Dm4vkBxZZ5UcbPOA0tKpiav2pvZwMtdXFBEJxvMEMwprm4n7J5KASw/RRNnFyynRPHzfF8auekwz9PJYoikgbQuImxnF0smz7N6rclKxZK5nk4dp48qViFIE3tmMlP6qX4Q/mQOA/QnKD8ZzH5BC1hGpGN2r4HalPgZ8jN66KhdngRe0KEXJV0n+s+2L1s45rCwIqvDLXKzadrOFd4/ZLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMc+EFeg9X1zZU6eW0NtIQufBh7TLS5qHw7SRqNyT3g=;
 b=p78dLgbDvpKjzAH15//d8BfMuC5VTlI0aR2si0RXtE+HlEPVAt+3RPSld5N4w/+48s9VHrrmy+lHwXmZ/oJDtCirFBv0FXD1nruYEKunLdHXC0PAIkE6lww4nP0PgVmWop4sF6TI1Vx9HvAkFiVDowcWA/7FpEVJXFImdDrtpj4aUJRhb490bDYxnbWd41PguxvQyjPsyj/vQ1tPrDmX7jCfBhl4Ylpp8rWIIS+pGsMBuFwJ7lrpKD0cF2T0LARqCMIKdu5LAcw1g17OPMnQMyhEGhnQCQ8jawE7iZwosaivEmCWuU0kllgvSeBENrtWvsqM8YPanIY8x1IuE1WcrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMc+EFeg9X1zZU6eW0NtIQufBh7TLS5qHw7SRqNyT3g=;
 b=F64nFylMwNd990n0XpWnWlNvRcS2od9e3rQrfY2ixfe/YWbQs8ONd31PzW/Mvz/dLyEWixiT4DdlU1a7QZLsV80tlOzkPffWoGGCoUeO+Lkvf8USQ/F45f87ctP55PxEX6rpynLDaT8hrcmo/MaaZmZmsfoYaNHs6gnmyaRziSucTtGYPGNaEm/pqDbX3bWgej6Q7geoCbXRPLt7rPNzkcW/Q2WShKZ1KYW8cTDfUEA8NCoLSLgZJlQhDCiu9NWZLU8Y6io7BFzFp1chYRHfbaEWe1iRAw2Y5w7PEzpXrYx1TMZe/+Pi3fUut8C1YjfTKGmvVBNyIKkSE6pW5Wezwg==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by GVXPR08MB7702.eurprd08.prod.outlook.com (2603:10a6:150:6c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 22:29:52 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 22:29:52 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/9] leds: st1202: fix pattern duration prescaler and pattern_clear skip marker
Date: Thu,  2 Jul 2026 23:29:39 +0100
Message-ID:
 <GV1PR08MB84971D3AF982F4F707A378F0C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0033.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::20) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID: <20260702222939.98154-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|GVXPR08MB7702:EE_
X-MS-Office365-Filtering-Correlation-Id: a0e70d4f-b30f-4226-9f5a-08ded8896ef7
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrO+2YmbT5jW+WUSUt4IT5vRf5AAVJ8TXpyQr/QWRq95q92v6FsDIMLk5+MgnA4gCbhSRev3i4YPaQG9/d+frtzx/L+/d5r7JKCtadUxwk2RBlGQP/wGsTcgc9An2nv1flEpKlg0AVSqO/jryZ0wSej1+7mV5oWz3pnqFP32tQEdTiP6zGVnoJxs+Y4aWkPFfY0vlxCtWKbZPJWY3F/2DM8/ENW11tXelEfo0RCMTskJXMylKtXsUq0xApeMX110OrNd9PQQEu87OjV8uFFJo3XnM9LsZxt5731gv1cipyVV4WfQbVw7ABfGINUow0znCL5bSiwrZIRNdbfn3zKKEZ9KIC6qFJXrIDRhLpDEnYx+rBz8MN7Mm8eEBMHF8eSAuQre4tPL6MGQ7k1TJgj0dSe+yXbcCY3DANHhi10PNNlZUk/NIvyvU4flYS3+kWkr8oq/7BX/bIxdv5otipfurGjrEwPw558NeBu7EZyyh6WZfJ2ntw06uPyFdthjzVvsUzcUxAcXlXnT44wCIHtQxpyJ5Ge3TdnUR5Pf1rn9kc2vGBMPZ4KXWAbnChXnUYUnEu7Flx1hqGI0RIsXWZwQJQXpHvILFnM8rifdxfYEnFa0yymJhDv88687LIkvxTneH0CgaRysOCqZ/Bf3X/QtFt7h3+NCBB40Syg5/wd0wiw3CJZDK2yeXrvgh/+DbwhaNDyoUpnygkN5blGXka7rshbOZ3n2aC7zKtjYXszA0Kk9mE81vlZfOfPxhpeK6nuMJTA=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799015|19110799012|51005399006|6090799003|24021099003|41001999006|5072599009|23021999003|37011999003|15080799012|25010399006|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVIzY1pvKzJXcDN2Nm16WmhmU3BBb1ZMQ3h1cnlJU0VLbndTWHRpOS90R1RI?=
 =?utf-8?B?a1YwZ05TcVhObmpBR0Q4VjFHWHF5azM5d3U2TXZhTTZSV3dJc0FFN2t3NkpM?=
 =?utf-8?B?RGxZTG1wNUxxVXpTZzVnNkxFemJHdk1VMzlXTnMwOEovOVU3QkZ2L1dESHp3?=
 =?utf-8?B?MkYxUmJFVjlzTzZWaXA4MTRCczZ0YXFYY2NvUFdIT0dhUDJ5ckJTWXREZmQw?=
 =?utf-8?B?U0NKSmNIYUV6M2ZnWWk5bGRNZUwzVnU0Q3cxb3hZZHJxWVNRRnJQZ1o2aXhl?=
 =?utf-8?B?VmlnSzhXRkdiUHptaXJERk5EODlSUGFrTnBnT1AzR0ZlUENPYzRSN2lQTi9Y?=
 =?utf-8?B?RXZXRU9JcHJ6NjAvRkJyN1Q4bHlRamUzYkdINDVvVDkxaEtuTXZxNGZPalZG?=
 =?utf-8?B?R01iWFluTTRXT3VHQXlYTDFCZzZSVWtZUXpMUEJ0L1VXZS8xb3l3Qi9veWpW?=
 =?utf-8?B?eW12WG1kQ2NNbVRRdXBIblJySTdYTTRlSVZHakZjVTJUMEpSRzFoZk82ZkM4?=
 =?utf-8?B?RGF1Q2ZNdU1CclhJanZiaTBPOFkvandjekhoOXE4UEh6ZWl4YWRDUDN5SEVM?=
 =?utf-8?B?b2pubVVVcDFNV2xIY1JyRkJ3L3VSY1ZQakhrYlVqajJTeWRJV3MyTnNUUEwx?=
 =?utf-8?B?YTV5dEJuczN0ekRyU0s4WDUzWmQ1SjRBUFVsOWZYZUtiKzVIakJqTU50Z2V5?=
 =?utf-8?B?WVhDRHJSZVlPOSs3eWI3UTQ1dHpPdkdUVXkxa29FU2x5RzByYnQrbXFsdGZ2?=
 =?utf-8?B?Q1RTQ2VpaWJvbWIveG9IaGZ1Zi8wSzdjTTVSbjBQTTVPT0MxeUpTTDdHQzE3?=
 =?utf-8?B?YWRDQmNjY1lLY21jekRVZ2VPVzg3cTF1dXZqb2VOY2lYbXQwNnUvL2NvUUNa?=
 =?utf-8?B?dDhuOHNOTVNJWUd3a21hZHFwMUdhUWRhRy9BU3FLL3k0Rm52akJaVHVDVngv?=
 =?utf-8?B?bUdkZWVxTVFYM3RXRWtjQVBKTk84TUcrd25PS3MyRzhLNGZEdVpKdWpEckVG?=
 =?utf-8?B?NS9wWThLVVNsNE9teThRbXRySWcrSW5VS29oKzVWYkN3cUtkOHBPOGx1QlhJ?=
 =?utf-8?B?UlZReW45QU9LN2xWcmhRdVpYNFdtb3dLWDQ0dVpsY0lvUXkwT3pHdCtyaVlD?=
 =?utf-8?B?ZzJ0TVgyNlpUMStwUUZDVDlEeG9IUVlNcWUwQkx5K2hraWh2VWxidmQxT3hi?=
 =?utf-8?B?SUZjMFdTc0lZZC9KM2FVSVBIS0F2TzZDdzVDVDZnRU9sanRFbU13eHhuRmlU?=
 =?utf-8?B?NmhEdjBUU21hcGY5SHA1eHN1Ung4ZlNmM2FKbmVLRCsxWmo3YlhOUmw0R3Ro?=
 =?utf-8?B?MVV2NEQ1NnREUVVCYXVIS0V3WnFOS0E1Y29sd3dyWmhZbERJZHp2NmdGU25i?=
 =?utf-8?Q?tTooisxAy5am/Glo3ERtvLkFFpc/BYJE=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eU8ycjVUSkhrVDlDL0ZwdG5qcERDaDBuVzNHUXgrYjlTY3crWXB2K20wcWNk?=
 =?utf-8?B?M0UvVnd2bE5iT0VlOWh0cnFXdXBOYmVHU1Evc2tSWS9CV2Y0RlRmYk01MkRp?=
 =?utf-8?B?OTUwOUNUOG9wMkNUc1c5bTlUVzhnNDgvZEo0bm1vYlh2cVE1K2tlNFpyaVFV?=
 =?utf-8?B?RXozQkV0aTNDSlNJaGl3YUlpcXdUQnR0eVZWUGtIeGRqc3lPWUlnTEFRQ0JD?=
 =?utf-8?B?bnRoUFEyZkdXVzFVY3MxSDNZQUhWaEhoR0I0cUJGbVpjVjFYdGlVK2lRYkxp?=
 =?utf-8?B?TTRUQU9hT3ZJZGZlU091N1Y2bVloQ2l6YmRRZVZEdXlvOU9RQzJKc01DNUtl?=
 =?utf-8?B?MkxiWFBUNW1aenM1TFljLzRkWUdCK1BRdUFkVW9LbEM2M1R1SGtXTEx4WSt5?=
 =?utf-8?B?enV2Ync0bVdZc1dzWjRGaHUvTGIrTGtMMGpJVU9EZUpaUzZCUmF5eUtwYkxR?=
 =?utf-8?B?Znc4dXZ5cGRpMG1KR3RoWG1LZ25taCtWVkZxNkpoZ2hMbnBtNVBEM2dNQW5m?=
 =?utf-8?B?ZUNnVEdtSDB1V1VreHpMVkpSYWNkQSs5NCtOQVU0SDE3NGpVeXM5Tk9tYkZC?=
 =?utf-8?B?SEl0NXB6NTBqZnE1OCttcmxaZFY4SzdrUU9aeHlFVVlhaHQwcUczOEtGZ2xs?=
 =?utf-8?B?UGlJQWxOZis3TDJteTh3b3NWcG1QeUNCeU9zbEZ1MkJOdmx3bmxpNGphL3RG?=
 =?utf-8?B?eXVxN25TdXpoMmU0K3Y4Qk5HbGtkcmo4OXR0eGt2NlN6akZ0VTVNTklEelM2?=
 =?utf-8?B?UjR2c2ZEWWNCb0x5OE9JWWFvYU5tQlMra1gwRFNkbDhSUllub1k4amViakJi?=
 =?utf-8?B?djlRSzJUQlNCSGNMUDBIUkZHd24reTE5RFNiSjh1eExmZ0VrVFJZWitIcGV5?=
 =?utf-8?B?V0FjejJzMnNLVldSRjBHSlFOazJqMW9sTGM2OG5jUSsyV3Y1WXkzeGVVVzJR?=
 =?utf-8?B?bVlPeUc0UjZtdllETG9wU2lMT05kMm1uY1VYQVZPVTQzZHpCTjdoOWYvTFBM?=
 =?utf-8?B?NU9yTUF0RTI1eDJDR09ka1JYL2lXQ2xGQmp5ZzZnZ0p0bG84UGduTEtTcjhG?=
 =?utf-8?B?TzdqK1ZiTzdQWmxvUm5BbitMZWpuaGJ3WDhLcno4WFZOL3VWNG9vclNjQW5P?=
 =?utf-8?B?eFh2OE52dzJ2V3NwM0ovOUU2NVg0aGVWa016SzFzRkE4TmI0NDJzUWttRmps?=
 =?utf-8?B?cnNtWHN3eHJyTWJiWXZaTU91ckhvSkdJdkxXQmxQTVl1aWtpbGxWbnRrcnpM?=
 =?utf-8?B?d0ZqS0U0RzNPQnprK1UwNGxIcisvN1NBd0k1WXJiU1Vnb1Z0UnFRMEgrTG9q?=
 =?utf-8?B?ZVU5M0J5cmFPTm02aEs4YjN2eWdoSmhJaU9OeW42UmJ1MW1iN2dFTzhaaS9i?=
 =?utf-8?B?Q2xWdjdsMzRsNFZTaW5Xbkl4UzRLRHFmeHFXbjVQTUV1amJYUXQ4Qm9TQnFF?=
 =?utf-8?B?ZzY5cHlleWx4RjhRQzN1UGMvMmlROU1OUUlrV2J6cStIS3pORmZaZXVRdU56?=
 =?utf-8?B?Z3JHOFZKamNDNWpERUVWOHQrM1pZbS8xcGtmeEtvcGF6cVpENXBQQUdUNmpB?=
 =?utf-8?B?Y3ozTmJwb2U1ekJRbUNkUklKVXczT3NiSWFVSm5kelhtVlZLZUZEYmkyTUwx?=
 =?utf-8?B?czdUc2ZKS2N0d0Rmc3l0bjVYVzZWMmVsbEVsVW1Ia2NDQ1h6V0JaR1dySFY0?=
 =?utf-8?B?OGdsVTlLS1cxeWk5NzFPVWREelpNTmlYeDFXcjdjbUZtSEpadDhLM09QTFFX?=
 =?utf-8?B?a1lsamVqQ2QyUE9xbnlsNUFybFJyQ0pjN2pGMGl2Y21KT3drM3A0dlY5MUYw?=
 =?utf-8?B?bWpTVjVieHNOalZKSERnakJuaE5qNmllY05uS1FZMzNuRFVPRGQ5OTFEdzhy?=
 =?utf-8?B?Y1dObmpSVENJY1NHcVROYWI2TFU5L1ppV0FDR2ZBZWE2N2NETy9ZTUtjaUVX?=
 =?utf-8?Q?IBN9gZyzZaqJzZ3xnlBhdJeECi/F2Uw/?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0e70d4f-b30f-4226-9f5a-08ded8896ef7
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 22:29:52.1075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7702
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8882-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,GV1PR08MB8497.eurprd08.prod.outlook.com:mid,outlook.com:dkim,outlook.com:email,outlook.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 803DC6FD341

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
2.55.0


