Return-Path: <linux-leds+bounces-8296-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id lkR3OCx5E2rnBgcAu9opvQ
	(envelope-from <linux-leds+bounces-8296-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2026 00:18:20 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8FC5C4892
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2026 00:18:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3B7C83001F81
	for <lists+linux-leds@lfdr.de>; Sun, 24 May 2026 22:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB673264F3;
	Sun, 24 May 2026 22:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="jW3dS+Jr"
X-Original-To: linux-leds@vger.kernel.org
Received: from WA0P291CU002.outbound.protection.outlook.com (mail-polandcentralazolkn19013083.outbound.protection.outlook.com [52.103.53.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465E1280035;
	Sun, 24 May 2026 22:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779661095; cv=fail; b=Co2KFCXibLnxLL6IXbgZS3B3JENCkMLSCf+42eTwSIq5+y4aJkt20kk/1dGcWy7USXHLy2zCuadAp2sF9OaIX0xH3+QCO6u+Gt8WGwXenhZk4rO/Hw1vNPRCQThaQ3lIawjiGWeePGahlh2EWfdNAQETWMvup+6F8kBmwkQ0Q1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779661095; c=relaxed/simple;
	bh=+4VwQ4aaz3sgcsTMMtYfQN31sgjRfyDwJZTrjOOBdas=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=lOZwmCXWJQZJonkKmsD9eBaNRzbD47jssaHMtI/B67YVxaiokV/bTVi8LTNCLbRUbdiLTS0Q6OCpJluUDWi1y8C6G6c1KHQi5fGQd+t1xvG9kgsi44KI8yb5w1xRx3srR2BGqZQDR72qJ7D68JKqMRwO+v186IUTZwm+Zdb/kjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=jW3dS+Jr; arc=fail smtp.client-ip=52.103.53.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G7Dj33I4WEhki8+EThRBOFQEFfwxtia0nx1PnHznN05z7VJwdoTiSgUsDQLwfpwz2TlRtj3AbAyt19+Su+CJ1eFhrsTgBFSjdvcHV2gMqTJEZdkKRprq30kszcJC47oUCrCXBD5rG/eLLciP2+HOW2sbGrYObBUqGpb5+5s+v5JsD3SFGsHRxCdfuqbZuY01+kJvYDS9HLm2CXbDiLvSpP2dENRYxy4BlYtPhuY3Ri/R+BvAJ6NURn3po7cp2+nwuAA17UB+61LKMbpaQnQkvXr1umP9bwy5S6DOUjYn/Qjhx3JA2pJgcFNSVCw6iQMK4fESAyf1Fwybxuatfaet/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YRNUCJT2XbZW2ScaUXr1n4wMeRAafKIlkjUnJ323hdA=;
 b=nFA0SZUmTUUYZ6PFqsAnGabeSn9R1eWnW0HCTbCUreO+2HZ/VOOfM9MlIzfqpw4+8+FfKmNcIqfpnkHCyqXI9iEA2o1vEIbt0nPXE5US9lX98ojjvvx5VqWi6Q+JuihGB0F7cWVLmvQHB7tAYGZBI633uxgTbonY4ttAOg8G4B0DghV8aWptL38IDuT4BJlRi51KIiNLHluMibON/pliAnYgXrb7u//W0HTJfq02BRqGYY7Q+0fodxUPpPAX2ZBem+abqoZ3CfqlywWSuQPoh6DmZceC/+/1/+AOZyZ2n/HSm/58gW1NZS3dIKUtxiC8j2j/3KvjB7xKTlYp+e3zyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YRNUCJT2XbZW2ScaUXr1n4wMeRAafKIlkjUnJ323hdA=;
 b=jW3dS+JrrELq+4FyLrG8aqhZ1NtmfcN02ci8m25caMogcxwOr/tYaqywubgpxGEn96KAtcH3g6KUTobi1u4lxqSZSi0/S+cTxFKfRHURjonptBdgNjetgpw1R1OBmIcW6dtO9pKuQ09PLB97WJf1IEy+xxGUn/DlmzY9wKgESJ1bQ/3mkPlms6u55HutahX1U3wnMYnA2QiSqh3boeV5/ZVuLGwdDLzoWvv3dMYrbrOqRNiL+UCXdSW8OmDIdwSCT2lRnweYg9vAR+xCI3VYEMQrwRPyxhZ86rw6HJZl55vu3bS5NwC3HjnmgULbuEQu1VBPxrtzpNIH3VHtLurt9A==
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:e::21) by
 WA0P291MB0293.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:d::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.19; Sun, 24 May 2026 22:18:09 +0000
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6]) by WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6%7]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 22:18:09 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/10] leds: st1202: fix multiple bugs in pattern engine and brightness handling
Date: Sun, 24 May 2026 23:17:55 +0100
Message-ID:
 <WA0P291MB03855101311F0506B6448A8EC50D2@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.54.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P191CA0008.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::13) To WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:e::21)
X-Microsoft-Original-Message-ID:
 <20260524221755.313928-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA0P291MB0385:EE_|WA0P291MB0293:EE_
X-MS-Office365-Filtering-Correlation-Id: 64188f21-ceb0-4ed0-a649-08deb9e255ce
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|51005399006|5062599005|6090799003|37011999003|5072599009|23021999003|19110799012|8060799015|55001999006|24021099003|440099028|4302099013|3412199025|10035399007|1602099012|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEdtUlBZN3EzLzhhYk1rZkJpQ1l3RGJhamhaTFU2Y3g5a0pLWlZIQ0FoYVR2?=
 =?utf-8?B?Yy9OUkNVNEl6cUhDZTM3Wi9YRXlTS3hVQ0lHbVZOMEZnWHdmWSsvKzFhR05S?=
 =?utf-8?B?ay9yZnRYV3JPNzVIZlc3eVRJZUtZVjVOeE1rNEp6QjVkaGk4TlZ5QlVZQTBw?=
 =?utf-8?B?VjQ4OTZuRE1oY3pSRUJMd3I1aERXeE5Bb3hBL1JZcjBkbUhJYk5CKzFCR0tS?=
 =?utf-8?B?djlqWmJ4akVZd0dzdzQvZVZpbjVsUThodjVWMEpMeTlzWXY2ZDlXU3JEQ1F5?=
 =?utf-8?B?d2hYSk5xRDVNbFVESzdDRlNFVFIrOHdXVFZpV3lDcXZrVGRxRUFQNFFCME9y?=
 =?utf-8?B?b0I0bW5yMjI3WVFGNWFSd3dKWlA1cnpqN3U0cDdiZG5ocGhqbm5YT3gyQ3o5?=
 =?utf-8?B?a2EyNXhBMTVqYVdHRUU2TnRwbGRiNVo2cDYyVVZnTEdoSWpXTFpEMHlscCs5?=
 =?utf-8?B?c2c3bHdFQjZ4bjVjdjBwOGp6U2dLRW5UV3I3TmdmVUdhLzRyMmZUbmx0dXgx?=
 =?utf-8?B?aEo4amhpSW5KMk9obmxXT2VRRGV5bS9nQllkTjk3VHJLcHpCMGoyNk1YbDdY?=
 =?utf-8?B?RTU1WVdaZXdjV2JFT1IyZ0dFYjJtR2JJN0FtT3FPT0dvWmEzZXAzNlo2RHZh?=
 =?utf-8?B?cXFpSWpESWhRWVhlTjZJY3hEMXpvUUR2M0lIdUJjYjlPZ29LZXpCTXlBaXNF?=
 =?utf-8?B?bnlqNlFOclBDS0tvMGxneFdtZEkwM0ozZGk0elAxRUhaeTNrenJENUt6U0VZ?=
 =?utf-8?B?Zy9id2VGZU54cXQ0eG9lV2RMTFMxRk0yTXVmallvK1ROVnhLV2xDRUswTkFz?=
 =?utf-8?B?UnRqTmVuNTMyQlJKeW9zY3JsNTJGNmZXM29Da3BtU2xZSDJ2WE1sYVBuUVBo?=
 =?utf-8?B?YVJUckVZZUIzeGJsV1g2cHAydG9KbVNEQVFCZHpHc01kcEFMRGk4eWFBb0Yr?=
 =?utf-8?B?Y2pwL3prcXpmTVM2MDliOGVXSkJlTmJ0ckp0ZDhobmh4dDZpMStHaFkwSklZ?=
 =?utf-8?B?clVXODdNaVNjQVNKd213bW5Ob3FMZnB6REtYYitMLzF2OHpWL2haMXNKUGh2?=
 =?utf-8?B?eWgvUWFBQTNWUEQwdWp6a1RoNGRYbnRuS2UrcGdRbU1NR0NDenZGZTVEZHpa?=
 =?utf-8?B?NUVESmxYNzZSdE4vR1JHZ2NwaFFZWVdqOHJQV1RQdERtenRNdlFaTER5UWZp?=
 =?utf-8?B?M2hYYnhOc1NIWU5tK1EySjRGR0tHSk5sdkNTUURSV3dBRWpnamtKeFVFT3ln?=
 =?utf-8?B?K2ZNNlcxSm01Z2hrbzZpZEE2MVJWdHN2eTZweE1LbzNwMlZxYVR3VDJSb1J5?=
 =?utf-8?B?RFhUbzV2S1hwL0xZM2MvMEQyTUNCY0lzRmdTZUljUU4vVVErS3EvOHFsMnVu?=
 =?utf-8?B?c1F3ZG1JNVBSNEtTaHB4a204U01GelpZMjN2VElzL0dQOFJ2NnpZaEVBM0NP?=
 =?utf-8?B?ZFZPNzVlbWR4Mm5BNWVaUnZScnNvSGtmbTRWamlKWGFjc1lIN21XUnpsVCs5?=
 =?utf-8?Q?kWboow=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0JGeWZ5aDhDWjRDNXdxNEFaTis5WDhwWUxvekl3THpyTENod202cUR5bEI1?=
 =?utf-8?B?bFRmcXc1Z2F4emViY1hzbDlnZmVFUGo3NjIvMHpJeGpYK2JkNFlCeFNTOXM4?=
 =?utf-8?B?WENhSm5NWG1BWi90Mm1HSEhOWDArdThlWE9HRVRuMVA2Q0o0Z01MUUF4cUo1?=
 =?utf-8?B?dHhFdGdrTXArbERKU2FTNWxJbWZvUFhyUFdsWTdYTFQwMVZFdmNRc3hXVFhu?=
 =?utf-8?B?OGhwLzdkOGFEWVo0cEFNeWoxLzZkT2hwVkZZYzlPUFFvK0dqblVuUWdHeWJH?=
 =?utf-8?B?OTljeEJpNFc4bkxzTzRJZyt0ZXZkaG1DWlpZdGdBSDZpWDdNbGpocmNBSDNx?=
 =?utf-8?B?bmp4dWsvRUV6YTNEUHA4MG5veUNYOUFVREFKb0o3N0hOUWRSK2xGeERpUzYx?=
 =?utf-8?B?ZU45d3R2OXFlNXdrSkxWY1BqZXZRVHVRejNzRU8wTG03amtwVXFEdWZrbnVj?=
 =?utf-8?B?MlBjODI1QjJ4cmhkZnNjV0JDa1VZaldRTHBTd3BNSG4rUThxVGlGY3JvcDVp?=
 =?utf-8?B?QTZaWmxoclN5dS9mMkNkdHZoc2IxWXJNcEZ3WmZEanNUVFFpWkw1QXRtaEtW?=
 =?utf-8?B?OHRObEVpaHJaUTB6NzlmOEl3RVZXdW54VE5vSXprY3dQdGxHNi9rK1ZLZ25y?=
 =?utf-8?B?U25CU1BIOE5yWDZDa3VXRjkxOGNiSFZ0OHNySCtOMVk0cVR5TEFOQ2FLRHVw?=
 =?utf-8?B?MVBzRFlZMHBIMjVTVU9zSEVsSEg2K3Njd2NZS1I5UkJEN3RQRHdsSEdWNXVL?=
 =?utf-8?B?Yy9mZjJReUg0akZUeG1WU3N6cEpvSDladDRTU1ZIejJXTGdpdDZCZFY3YVd1?=
 =?utf-8?B?TVRlWnBWV1VNanBEVlgzbGpCVlptMUxXSzVtWHJVRmRUWjRLLzVvQkpTanZp?=
 =?utf-8?B?eG1mbGwzcjRCYW1xU2ZGMDNNSVFRSm1GT21zNTBEN01LVmZraEpLOEtlSlpa?=
 =?utf-8?B?dEJybzcwODN6clQrRlFSeFdnOXRyOHF5VVVGM0ZQTTdKajRyc1lnQktTdytH?=
 =?utf-8?B?bFlYSG1CeVRZYmI5WXBSbTZLR3lnODRGRnBCeVBwbG0xVVltNExTMU44RU14?=
 =?utf-8?B?dFhDeTlKTk9Vc1pJMi8yR0hjdDRUZlNJUHBZYWlHUDIvWURtMlBNM0hYMTJ0?=
 =?utf-8?B?Y1FJSG9zWkZ6d09zdmdOMytJQ0RndDR0enErRTM0Q2NEd2kzZXZYZ0N1NXV0?=
 =?utf-8?B?cmw2YTRWS3llbW9UWWhibTdsSmNNSmE3YjRCTHJJOU5EZjRpVllWY1ZNOEhh?=
 =?utf-8?B?R3BNVEJvbkFEOThpZXpJamMvcDhwV1cyU1BhbG1aSWEyWk5ZbmZIZWlpbUty?=
 =?utf-8?B?ZE16Q0x0VVN1eFNaZmV6MHdzWmwwb0k3SENML2IwRXkzYWdjT2FVaENXZFla?=
 =?utf-8?B?RnBhRE1VNFYrQ1ozb1pSYStvV3lwamV6cWF4L053OTl4eklidEpleGxrWGc2?=
 =?utf-8?B?akFuWFNXWFFaM2hYSVJNS1hhbnloeFRsTWx1U1h3UjhtTHJjZktEWWRaQWV3?=
 =?utf-8?B?QlZFdEtndnVISkhWQmd5blRmdS8xNExiUzM4U2NBSEVWMnpTajQ0bGkzbjl5?=
 =?utf-8?B?Um5pRUtaQkN1a2xkOFc0VklxVzNVR1JxTzAxcTRuYjZvVEQxTStyMVhSdUJ5?=
 =?utf-8?B?SXhKUjlWNXpiR2VQUGpVMHlrKy93UVhTU09McDV2ZGpQSUVqRkRTNHhKRG5Q?=
 =?utf-8?B?NGQvK0tRK3h5UjZqdEtLOHRuZlNJNTR6dlBTUWY4N3Y4d2tWc0RwQnJJc1ln?=
 =?utf-8?B?V1NseXI0MGZDRVpyNEs0bkJqNFFLditRajhZVFJEWUtTVzgwUUtvRzRySnZa?=
 =?utf-8?B?Q1VVN0huTHRqZ1M1T1BNTUJpK01qcUsrUVRKRkM0K2drY0g4ZEtmcU9rZHd2?=
 =?utf-8?B?bDdaZ2lxNlczSGtnSnl4RE84OVZ0QUJaa3gwcEwxUVVzazFLYmRYbUNxSkRJ?=
 =?utf-8?Q?xYL0suEvjSE/XiSXbDyk/Uts/BO205IP?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64188f21-ceb0-4ed0-a649-08deb9e255ce
X-MS-Exchange-CrossTenant-AuthSource: WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 22:18:09.1534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA0P291MB0293
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8296-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	DKIM_TRACE(0.00)[outlook.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:dkim,WA0P291MB0385.POLP291.PROD.OUTLOOK.COM:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: DA8FC5C4892
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series fixes several bugs in the LED1202 driver related to hardware
pattern programming and brightness control. The issues were found during
testing on a Linksys MX4200v2 router running OpenWrt.

--- Pattern sequence not stopped before reprogramming ---

The LED1202 datasheet (section 4.8) states that writes to PAT_REP and
pattern duration registers are only applied after the sequence completes
or is stopped. When running in infinite loop mode the sequence never
completes on its own, so these writes are silently ignored by the
hardware.

  Patch 1: Stop the running sequence by clearing PATS in the
  configuration register at the start of both pattern_clear() and
  pattern_set(), ensuring the hardware accepts new values immediately.

  Patch 2: Validate pattern input before stopping the sequence. An
  out-of-range duration value should be rejected without disrupting a
  running pattern, so input validation is moved ahead of the sequence
  stop.

--- pattern_clear() leaving hardware in inconsistent state ---

Several independent bugs in pattern_clear() left the hardware in a state
that affected subsequent pattern or brightness operations.

  Patch 3: Fix the duration prescaler formula. The original formula
  (value / ST1202_MILLIS_PATTERN_DUR_MIN - 1) produced an off-by-one
  result, writing the minimum valid duration (22ms, register value 0x01)
  instead of the skip marker (0x00) for unused slots.

  Patch 4: Write the skip marker (0x00) directly to unused duration
  registers in pattern_clear() rather than going through
  st1202_duration_pattern_write(), which operates on millisecond values
  and cannot express register value zero.

  Patch 5: Reset PAT_REP to its power-on default of 1 in pattern_clear().
  A stale value — most critically 0xFF from a previous infinite loop —
  would be picked up by a subsequent pattern_set() call in the window
  between pattern_clear() returning and pattern_set() writing its own
  value.

  Patch 6: Restore Pattern0 PWM to full brightness (0x0FFF) after
  clearing. pattern_clear() zeroes all PWM slots as part of the clear,
  but leaves Pattern0 at zero, so a subsequent direct brightness write
  has no visible effect until Pattern0 PWM is restored.

--- Spurious pattern sequence start during setup ---

  Patch 7: Remove the write of PATS|PATSR to the configuration register
  in st1202_setup(). This accidentally started a pattern sequence before
  any pattern data was programmed, producing undefined output on startup.

--- Brightness control broken while pattern mode is active ---

  Patch 8: Exit pattern mode in brightness_set() before writing the ILED
  register. With PATS set, the LED output is determined by the pattern
  engine regardless of the ILED value, making direct brightness writes
  have no visible effect while a pattern is active.

  Patch 9: Disable the hardware channel in brightness_set() when value
  is zero. Previously only the ILED DAC was zeroed while the channel
  remained enabled, causing residual current through the enabled channel
  and a visible dim glow on the LED.

--- Documentation ---

  Patch 10: Correct and extend the hw_pattern documentation. The maximum
  pattern duration was stated as 5660ms but the correct value derived
  from the prescaler formula is 5610ms. The repeat field documentation
  is also corrected and the brightness range is made explicit.

--- Testing ---

Tested on LED1202 hardware via I2C. Register state verified with i2cget
at each step. Correct LED behaviour confirmed across pattern cycling,
infinite repeat, pattern_clear, and direct brightness control with
trigger=none.

--- Changes in v2 ---

  Patch 3: Fix commit message wording — programmed durations were ~22ms
  too short, not too long.
  Patch 7: Fix Signed-off-by typo.
  Patch 10: Add missing quotes around commit subject in Fixes: tag.

v1: https://lore.kernel.org/all/WA0P291MB03850F4E9B4EC7389FE89779C5052@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM/

Manuel Fombuena (10):
  leds: st1202: stop pattern sequence before reprogramming
  leds: st1202: validate pattern input before stopping the sequence
  leds: st1202: fix pattern duration register calculation
  leds: st1202: fix pattern_clear to explicitly mark unused slots as
    skip
  leds: st1202: reset PAT_REP to POR default in pattern_clear
  leds: st1202: restore Pattern0 PWM to full on after clearing pattern
  leds: st1202: fix spurious pattern sequence start in setup
  leds: st1202: fix brightness having no effect while pattern mode is
    active
  leds: st1202: disable channel when brightness is set to zero
  leds: st1202: correct and extend hw_pattern documentation

 Documentation/leds/leds-st1202.rst |  9 ++-
 drivers/leds/leds-st1202.c         | 95 ++++++++++++++++++------------
 2 files changed, 62 insertions(+), 42 deletions(-)

-- 
2.54.0


