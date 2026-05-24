Return-Path: <linux-leds+bounces-8299-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COc2IMh6E2ogBwcAu9opvQ
	(envelope-from <linux-leds+bounces-8299-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2026 00:25:12 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D7B5C48CC
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2026 00:25:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2AC630071F6
	for <lists+linux-leds@lfdr.de>; Sun, 24 May 2026 22:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4216D32B119;
	Sun, 24 May 2026 22:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="IRP+GgYz"
X-Original-To: linux-leds@vger.kernel.org
Received: from WA0P291CU002.outbound.protection.outlook.com (mail-polandcentralazolkn19013086.outbound.protection.outlook.com [52.103.53.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1663301460;
	Sun, 24 May 2026 22:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779661509; cv=fail; b=LQ6lpgVo7CBmQTeVUhC3oq7ssoWpPwnoggHLe4iFBqkfjQVHola79OPZzSzpPuen1QLIqdiBRfnqDbAoKNZN/W6euBJ1o0IYta2tnDAGUVpIwynpK1p/VJN8IuZCq1OXR42ckFxVulRd3mICGJKCWuTBAYwget5OcV1KLa/1FyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779661509; c=relaxed/simple;
	bh=wZLsx4hbDmbnhsku+C12Vju397lZBD+SjJM3ijP+s0I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=urBXhd2wl0UnhPd8e0AKCvwE8Xme7HOfcbwQtPsd4mecCSSX0J1vTEn1dXU/SVwnGcMg82k5m1MEkPJhx/hHxdXdo7Ja4pXYXcB+7JHcBXSF1sC5aSiToN9uzYb4c7V22SjgyTnKSaXKMv9wtx2Hn2VVyQyxmO+UxsKnLOVI15c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=IRP+GgYz; arc=fail smtp.client-ip=52.103.53.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jkN+R+uWojjCw9F82Ef1Whv3pTCjC6mJP68ZKx38Qc/4h3BHpmGa/SY80W4eROafn2XNTg+vpo1O19CCcH5OBKVOrZFRluDLRm9a+iQV92GOk4+kHlhbwAbbbGdLc8NYKjEwxSVNS/hca8slkHKGjyvHDy2GfV2pKeK7kDhx0RUwoQtUoTzVdTXZ+HLOhw/kdkVYjLTQOOa0aCbdZW5MDK2Ec8RpAOXJgaj667wi/3B50k9Rc/cVrJCPubvk3IM1RGRlJNwnfANttiYi7o9ZksU3ueiHuybrQHHQcsI3HO8RYyeRSzoR9t9g8yTZvWcd/OrQwDAsqm1K9sRckYjrkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8aGKU5pFmxcVh82bH/OYvh+NjGylTDwkTwLW58Wdr6w=;
 b=OeNesUrbSI4GW+W7p5BCLQbeTtscj7FPGI+kXBnAutKHYfEmHyhbc7pYcxQhgZt5T/W/200ux8bdrR9KRt34UiTsXBEG5ldIW+mc4isP0NAe/wn6bpxQnKSrIWE73a2RImYogqg/LhLngs5eXiyHqreVGxIhfROohrVIiDA5k52AR4jICLrSi+53fA+eZAkFaOteEl2pR35MtDaPZjAesZ7wD73I2IKfiVJX3N+zAFmjUPyBXPDoCw+C4K56OBcMh2icTC1xH/QFTPu/0xn2RWo/5ob7ch84QpSl9BiyzZHVtNzoySf7EiQ+4TedkLVnXuIB+tTrcc+1IFsunLjYeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8aGKU5pFmxcVh82bH/OYvh+NjGylTDwkTwLW58Wdr6w=;
 b=IRP+GgYzXyzwn0/Fko0TOYZNUuAtbPa+AfJP+GP5vcqtrnuvhWAA8RE/NuUzxeyypxYmUVASTiv635ULqnm1TDEC41fEwTsIKl95ysKVj5hLWMANYW8xBeCXy6P2sw/xkHkE58RXCOfcxueTirQNsZvkjrxY+M7ie9+rTFG7+Kuzrn7dz93+iJD66TlQ0csRRnQTmJUX/T7fz2kh/pTLQQ7eou6JfjORlaG+mDFQmE/3imyzBg7EPqY/HnvtHz/Aha05jEcw0VGkjmrniwlVwHWmeS/bqk2I/eZ9xwSP+SwUDjgLIJB5jnlYQlHxwCzzPS0am+Eqg/+ZszPtG9FCtQ==
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:e::21) by
 WA0P291MB0169.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:5::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.19; Sun, 24 May 2026 22:25:04 +0000
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6]) by WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6%7]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 22:25:04 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/10] leds: st1202: fix pattern duration register calculation
Date: Sun, 24 May 2026 23:24:52 +0100
Message-ID:
 <WA0P291MB038534C11DDD5F7770D07EB6C50D2@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <WA0P291MB03855101311F0506B6448A8EC50D2@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
References: <WA0P291MB03855101311F0506B6448A8EC50D2@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0387.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::14) To WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:e::21)
X-Microsoft-Original-Message-ID:
 <20260524222452.363809-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA0P291MB0385:EE_|WA0P291MB0169:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d9766b4-1276-4e14-f366-08deb9e34d7b
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|51005399006|6090799003|37011999003|5072599009|23021999003|41001999006|19110799012|8060799015|55001999006|24021099003|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YXFvOVYvZFVmeitaVVpaNitISDJoSnhLR3BxZFczQ2c2T3VkbkZJVDkzTE5l?=
 =?utf-8?B?RGZpSXRSM1ViRzZxdWxFS0orRXNiZU9VRzhaelVEVUl2VVNzcndWcXVMRjNv?=
 =?utf-8?B?ZkhCeHVpb0dRdE9qeEhiS1BCMjdjY1NJZ0E2eGlCb1V2MG5XLzhEbUNSK3dV?=
 =?utf-8?B?RkovQWlYdDhySlFNTmwyYzhyYzl2RVBoeS9wdjBubFA4MEhmOXQ5alBrMkZR?=
 =?utf-8?B?SEJ4QmVtWTRRR1RaOGNzSnI3SUlLYkhXUGh4a09UY2pBbExMUUZvVDdINkZs?=
 =?utf-8?B?aU1GbXVqeDRsV2l5bC9UOFpWVHVjQzc2ZndaTElhbG10aVorYVduZFpFaFNl?=
 =?utf-8?B?VzRlTlhuQVh3dUxZV0lIRDg0bjFSeTB1WlFNYVZmV3JOdWpxYXY0TGVzbDNL?=
 =?utf-8?B?dVR5UlN2Q2tpVzNSR1NvL2pzcDVYTzArZHBpR3BIWjFKVmJwZ3JDR3Z2cHVD?=
 =?utf-8?B?NWVWWUNuTG5sQ1NpalhtYnUwampnWFUzekRoaWErWUVHR2tjVXJ6S3JxaERk?=
 =?utf-8?B?M1FLRllVTC9kWU5ZYTZKb1lZQUdZOUdRN3NrOTQwWU01MzNKUSttNG80YW9m?=
 =?utf-8?B?QTB6TlJBaUIwTDNxYk1IS1FKM21KQTJoOHM4MXFjUERjb2ZVaWYxU2FSc0dv?=
 =?utf-8?B?Tys1cXNmYks1TmE2UmM5V0pXZmRJRVY2c2lHa2NEN1YrQnU1RERZbnRKVEhJ?=
 =?utf-8?B?cjduSllleU9ydG5mRzlibFdyS3N4bFBZcWJ2NTNWU1FZQVpaZW81b3ZjSHRn?=
 =?utf-8?B?aDVxcUl1N3J2QVYveks3K2UrSGhMVjFnQmJ6UjVDajlETThCdENBNERmY21K?=
 =?utf-8?B?eStpK3cxaVQraHlUclJ2S0RWZEpRSldQdExVWWs4Qk1zKzYzUmVmYVlEUDNa?=
 =?utf-8?B?TWt0b2laT29BZ25NMUtzNWJJSVYvaHRPNXNhemZLeGZGWDlzNWRoOGJ3dVRE?=
 =?utf-8?B?SW9OK3RyVm9GSFpIUFl1aUN5L1d0VVBFUUh5MTJtOUNuamlxeWNOQUZhR24y?=
 =?utf-8?B?azFaRStIRlhiWUNTTjJicFlRSjYyTG5iZUxhVGpTUUVQSHorK0wweng4TDdY?=
 =?utf-8?B?cVl3NTF5K242YnZDUXlOc0hHdkRBdHU1NGVsTGo5TTVyQm83QjRJWURJRXd3?=
 =?utf-8?B?dFUrWllPR3lLSmpyMGJseFlZdG54dXRteFkyTS9jeDB1dXQwbnhtUXB6RVJ1?=
 =?utf-8?B?dEhFTEo1U1JmV25xbFdFdG1ZVFFuTHhFemJjaW9aVlZwNElEN1VmOCt1cXpR?=
 =?utf-8?B?cFViOGF0REkyRXN3bVZkU2xJOXk2MTIwTTRkR0I1TzFTRk5CQjhyMVdnc3dG?=
 =?utf-8?B?d09JNVZoU0VTd092SW5NTXlhZ09xSVRxNXVBSFZxNVJvRUNHczdjc1VlNWFt?=
 =?utf-8?B?Tk5wekNGWnZMNGFrSXFrVTNXTkkraXZLUUJxSXhoWWErbjVUQmtzSm9ISnJF?=
 =?utf-8?Q?JOA2Eooe?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWh4WWloemVvOGFoN1E1ckNzRkRkRVVqbmh1aEJTTTJnaTY3L2N3RzJJQS9S?=
 =?utf-8?B?YTg4ZjFPUXlmSHdhQ2R3c3hSa296amZQa2VsVXJHYmNMQnBxRERkYTh4OTNa?=
 =?utf-8?B?RmVVSHZqRzkvcHc5STkzb1lpRlpxbUordGdnOTFkUHg4bDV0cFVkSVVjS1pi?=
 =?utf-8?B?QTlqQlJDSGVVQzlsdCs3czdhNDVwZHhNekxKcHpBcEVZVEd0a0xJNFFFaUtk?=
 =?utf-8?B?Y1hzNStrcXJ0aWlMa1BTWDJZQXlMODZaVVdHSFVyVjBqdW9yUUc1WHJaU09S?=
 =?utf-8?B?RHIyc1ZDL3RpTENzYmJIMGw0dVZmajNUblZrbFJKWXErbzhyYWZxRkpKMFg2?=
 =?utf-8?B?aVJxaXNXeDFMOWJiM0szN0RiMUJTM3cvdkhlL3J1UTdXRXZDTW0xQUdoKzdu?=
 =?utf-8?B?QTJvOTBscWZ5UUMyeUNwUE5uV3FOVFBCRDlPWGt4RW9Ma1NmSFFUc0RGV1hp?=
 =?utf-8?B?NitydDFtSng2R0twQUNYVzFBbm15NUJXODhWOFRZbUF4MmJpZ3pydGp4MUUw?=
 =?utf-8?B?bDNTcGk0Mk1yR3FkRklLeG1UcU0rU293WXA3RHBnRnd4NkZHN1ZqaFNxOUpt?=
 =?utf-8?B?eml6amNYZnBNVmh0U1pmclE4VGxJTFQrckhMaUR1RkpKSU1ubnZzSWlXRTVq?=
 =?utf-8?B?Si9MZ2NKdTVMdzZ2NjUxSHB0ckdpUUNIU1JVRnIyRzdzWjEwZlloUVNWUVJ4?=
 =?utf-8?B?UStKSUQ4dTN6bjg4aUVDVGFtU2NFY0lmSW8xWW5VclpKNUV2TXlUcCtLQjZ6?=
 =?utf-8?B?ZTh4akRzWkRweUs0b3hJT0w1NEJiOTZTWVBSSm5uOHBRcVZJZTNxN1lJd0hs?=
 =?utf-8?B?ajdnU21SRmx0c0MzeHZYMjJBRnIwNmFvT0RjdmFXUk12aXFxL3VzcEtVcCtH?=
 =?utf-8?B?TExsOXUwWEF5L0tNN0s0V2kzWVdkQXoyajdvSVBpZXk3WFc0TFVoaFBwVzJN?=
 =?utf-8?B?SVplV1FMTCtHR29WSUdueCs0TkNIb0MyMDJ0Z3FNZWl1dUFOL0JnWTgrcEo2?=
 =?utf-8?B?bmR5MDNSZGtMOFl0TGFYdUVTWmZIbWZ2QVpKZmc0NGhJbnh0cEdmU0U0Zmxp?=
 =?utf-8?B?TGJ1cFpYaHhDU2JxYkczenRMWXRObk5RT0pFaFlCQ3R2bmFNZkw1WEMwOXNm?=
 =?utf-8?B?REduY2lCSGxMN0FuQy96MnNkYWkwS002c1pHZWZpVzdQaGVFVzY0S1hTTmFa?=
 =?utf-8?B?RU1lbVJQN2JRT1ZQMkpudWZFUjhlVzZSWDUwYTNvTUhYN0I1QWdDK3hkQ3pz?=
 =?utf-8?B?TG1UUGl2MlJ0bXI0UzQreHdZd1pMUWJrT0hWNUtQNDZUL3NzaTdGbU1mNGdM?=
 =?utf-8?B?TGx3VDZQeSs5RHdHOGNxSzJqTEtnaUtqQ05UeWkwY0dKMCtOSUlPZHJxdDZs?=
 =?utf-8?B?Zk1mdzZPYXdoNHB3Q1RCdUNKZy9saUhSaTZoaHRjMlNhZm54YzlxVjlYaXpu?=
 =?utf-8?B?KzdFRUVYaHpqMzRESXQwRU9UTlluUFhicis3SzBKeXFBN29EZ3RETk4reGtI?=
 =?utf-8?B?eHFBbnYxbVZkZWZEK2g5TnhaUjU1Q29Na00vZjNFZERyWkQyMXlldElnYW5E?=
 =?utf-8?B?cE53RnZIdTFLL1h6YW5ua0JmZXk0NzlsazdheTJHbWhIQUNxUXVhZWFTSVJZ?=
 =?utf-8?B?U0pvbk1iRmhEckhBTHByNzR0TzExenNON2tPd3YzTnFvMXhPaE1DYnBzN0Rt?=
 =?utf-8?B?RXJXQ2svR01lZGcwY1VVV0pNZEx0eEJKZGl6cEVhdjRiVUtyMGc4Y2pEOTNJ?=
 =?utf-8?B?TFBXMGJUWW1YUkF6U3BKL1dRaFFaZlRTaUVGYWZQa0dRMHdyZU4yUE5va1RN?=
 =?utf-8?B?VTFFRkRFK093M2NQOS9MVkVYRHVDWXlucmk4eTdncGs5djNxVlF3L1p1QnND?=
 =?utf-8?B?Nk5LKytnYmFRdndDbXUybjRFQ3V1aTdSZEc4bnJkNEZWYWlEVjdIZUZzVmlB?=
 =?utf-8?Q?FoAXX1Erxlfv7UtPGJj1jdTdsWbMiD2z?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d9766b4-1276-4e14-f366-08deb9e34d7b
X-MS-Exchange-CrossTenant-AuthSource: WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 22:25:04.4731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA0P291MB0169
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8299-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	DKIM_TRACE(0.00)[outlook.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,WA0P291MB0385.POLP291.PROD.OUTLOOK.COM:mid,outlook.com:email,outlook.com:dkim]
X-Rspamd-Queue-Id: C8D7B5C48CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The duration register (PATy_DUR) uses a direct encoding: register value N
corresponds to N × 22.2 ms, with 0 reserved as "pattern skip" (§7.10).
The driver incorrectly subtracted 1 from the register value, based on the
assumption that register 0 was the minimum duration rather than a skip
indicator. This caused two problems:

  - All programmed durations were off by one step (~22 ms too short).
  - Writing the minimum duration (22 ms) produced register value 0,
    silently skipping the pattern step instead of setting a 22 ms duration.

The maximum duration constant was also wrong at 5660 ms. With the correct
formula the 8-bit register saturates at 255, giving a maximum of 5610 ms
(22 ms × 255). Values above 5653 ms were already producing a uint8_t
overflow and writing 0 to the hardware.

Fix the formula and derive the maximum from the register width so the
relationship is explicit.

Update the documentation to reflect the correct maximum.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 Documentation/leds/leds-st1202.rst | 2 +-
 drivers/leds/leds-st1202.c         | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

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
index 5f4238181057..02db1006fb53 100644
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
-- 
2.54.0


