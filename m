Return-Path: <linux-leds+bounces-8496-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id udUpAlDYImpieQEAu9opvQ
	(envelope-from <linux-leds+bounces-8496-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 16:08:16 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 505A7648B9B
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 16:08:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=Wimb+zkX;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8496-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8496-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70DDA30534E0
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jun 2026 14:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED8A226F2B9;
	Fri,  5 Jun 2026 14:00:00 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazolkn19013076.outbound.protection.outlook.com [52.103.35.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DED19D071;
	Fri,  5 Jun 2026 13:59:57 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780668000; cv=fail; b=c9PnQRN7wEvHyac6XvohUzH3hX/h2jMz1/isb0VycSF8SK4ylrZ6VHY7jozoEiaYX/Bh3M4Z4iwz6apyAZf9bBAy8WScA0xxrLij3hzAnyZwF2GXnXgoRkWslvuf1Tz5dnZImz5HX+KRxYuMS/jmPFw5K3IahjPPvwUDJsDsK/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780668000; c=relaxed/simple;
	bh=Nme8VLwqjS8k15r0SdW/jVSbiI4j+lZ+7cG15H4r0vc=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=BIdVMgwBHSBIUaMSkWaPAcg4FOm6NmHnffVW3sJ413ldpn9XjaMWjjl+eQ6SB9NLSYCuxNsYU2zRw7s2Y1mr4aIdLNWYw1gu4QiO8Pe+mhpBOYLa8ehxP6P88zTjc20tXIdhJo992vM8u7HTatkR44d7+VGtr4IvG4fOtiUFxj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Wimb+zkX; arc=fail smtp.client-ip=52.103.35.76
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K7PLROZ8aWfjhsmkdRYZ3QE72BQ/xtspKs0F4p7Q5t2PIP4/8duaVBxoT+euwZeLsJYJ5Or93NzNM+ih5doLFklx3KPUda27dhLLUHt4gEHDtJwpidvWUrd8CDOXJf9gcjbg3GKjUtp1o3b0spsh9Ce+eKWaOl/Rn4dAoQmPKL1htvAeNOnst7xr7a1N20iNPohfYg+pqHiJ/giR52i9HG9gcu5vVt4xNnzIkXq33NJbB/RBzWjbKiIoe2Ze0sNOC2r0hqxps8ZiJij7ZPcqzPlvM09rzt9M5iwJVNFTn7GxkpFTAvrkykKRaAQK/768FJmV6WNhTH68+vixUmHdrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVUbkIH6kylzufPT3f4W0NDLoKsOYloejMBDlECnBxg=;
 b=AKitL8FiN8r1HuS3XtqBb8GySEYlA2Qr2UNe8H6HdzZdwSn8kvZhYTBw7Jzxu5kajGb5dTvZW32MTNM2H+X3zmwe21EnOz9vvRB4vQJdlrwPQI+GKmWL+Sp0P+sXN1JxGNmwTYV4lUJyeYd+TBTS/kEdvw6lZaNbAXBs4djDf8hyc0nYDrs1tA6264mo6cD6goViRHNnECjMB5aI+NP2C6VaNMG96yihex917DQT9VwehY3cObviU/2xIMG9eGuHMv/w4bWvObnpbX+VNuqN5lPtLRWPrslmUOaf9Ugts0r2i6pnYRRffRZOlqwhcbKtc2NL2F7VpUwyjAUkGHH+Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VVUbkIH6kylzufPT3f4W0NDLoKsOYloejMBDlECnBxg=;
 b=Wimb+zkXZbW0SrkAaZ0gcP/hqHaYPsqMcloHYF5KxGpasHjsy9SeBwjKsVZojZYeK3wHxexhMoiJRAjElrn7DkNkgDynMo9E5+cT5jJRVOq/6GbjV1Ecpbi5ETqK2DlW830zIFmmZtD4p5A9hcw5MDZ2lGCyAvG7h0Erio39qsJReBv//Z2X/RDVfiiY7mzx6iY7/S6zugthOgzk61MR2AFpAlb700iriXK/JhRfgoZbGlD42TcOWgTHBL0+XKurrpMqtch+mP9TeQGNo5xRTssA6QHjgWgwTPPjekZ+9jHvmyAST1qaQ6PyL8GhPImnL+7YgplwM1CI1VaRi7G7Bg==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by DU0PR08MB8116.eurprd08.prod.outlook.com (2603:10a6:10:3ec::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 13:59:55 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 13:59:55 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/9] leds: st1202: fix multiple bugs in pattern engine and brightness handling
Date: Fri,  5 Jun 2026 14:59:41 +0100
Message-ID:
 <GV1PR08MB849762937DA5B82DC89F1CC4C5112@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.54.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::10) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260605135941.1409580-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|DU0PR08MB8116:EE_
X-MS-Office365-Filtering-Correlation-Id: bbd6acdc-0c87-4c54-9b8d-08dec30ab86e
X-MS-Exchange-SLBlob-MailProps:
	laRBL560oLSPhlJ95/U7v6W/AahuugGaTts6+v7V8nnKJLM050Hqud89x6CT3UqLaCLGkM2wraSI7XkymuhWqQ+CRpFkmoEs5DeXaJtkJUqvHuss0S/3M9VWhRmM4de9BVeJQGjMkJO98iZdTVsOdmCVUwRr7qlpc8TgogzI6+kO9UENPIBZ2HnqnqdGqXJAiG0qRRINikP4BHp0RiQwuWxC5fgy4Xws8SUxbYnA5duu04k3TjBhK/8J/ARN4YtSNL2gl+8xOGpBuaRc9BdY8qLWeOzXTDOcoamRd2cOcqSeYGHbKT1NOYZstmmYKUkE2rPVPGj0ruhZJZGddoACORK9QKI7AT3gA2gnQNm1JmKgVNYCEfPDFu+ggKAAk0vVoE9sYQ3hHdrPF9GNQ9bThmVsBCCHvwlbcP9YLIGgmK0uDDFcdhehXsxcuQz8ankMNb5HAKMY7kzoIr5KE8INezAX8N2emvHmoj0x7PHRxPazGhaeQdeuW1y4adTN4LPsdMrY2ybeyxTZAMKDWp8vsqFsubfmduyR56fJplwPncFsHu+AIGlACJJ+Eg+hhJcI/YQcTQqjZak4cgQ0a01YClrq63hrG/4P0demXuUkTxcmQbqpzdd08+bIrSj2Lzi4vVWOEcwofSI0ry6kXxQenJL93A85FdAY1OdmUraWckwltZPjyTDlTlR5p5GlGn7UKIaVAVWwSQIEay1UafOa84VqRJGiDchf0sHzEdiHI1jmt8x9CChh7cPdXAH3cxopBrX7BV0x3S/73QxCksfwD3DHvZxBzyIQ
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|6090799003|5062599005|37011999003|5072599009|51005399006|55001999006|15080799012|19110799012|8060799015|23021999003|1602099012|40105399003|4302099013|440099028|3412199025|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZkxBbTBXa3BWMDRxM2ZSZWY1RFU1UXM2VHQ3R2lLSGhsTjJhR3RVV0xsd1BQ?=
 =?utf-8?B?cnpYM2trUFlsdEU1R1NBMklXSXdxK0Zoc09DM2g3Wmx4K2tjNk5IN1ZSSkZD?=
 =?utf-8?B?ZFptRGxTcWJRTjFZaFpBVDlaejJaNVJmVDRxblBJUWlwYXMxR0VEZU5Id0Y1?=
 =?utf-8?B?MXNwYzU3N292bU5VTnFsbmliOWt6bXN1SHpEZkVTWlRYYlpsaFZvZnlBa2lN?=
 =?utf-8?B?RnRpMDlBLys5am00WlIyd1B1SnVidlF4Z29RdVFSb2U2N0FEMGs0bkVRcUhI?=
 =?utf-8?B?NDNDQlQ5MlhyVzFlTmxSMWx0aVhVcVVlYUk2WnhUOTI0SjhCbDNMZlBmbVhG?=
 =?utf-8?B?NHlrL0g0VDVRUG01MUp6Tll4Q1c0cnMwWnd2ekFGWXlVQWJZMXJ1YTJPck5H?=
 =?utf-8?B?ZGJoYnNObCtxRmZsS2RybnFJNUY4Q1lGRGhja2JJNVBhaDRMWGlMbnRBdmZC?=
 =?utf-8?B?VGF2R0pGZUpGbEhxOHhhcWVNclZkNVI0NE96SGhuYWpVS3pGa2Z5RjBBdWU3?=
 =?utf-8?B?eWlrbWJDdmlvMWpzK3Y3VEJtYjZxdDZMQm9hV3dsLzF1QzB5VFA0UnlwbGdT?=
 =?utf-8?B?eXNYNi8zdUFHcXMwVHVNOURvbmc3VThuWC9idTJiTkdiWWxkSDVUUzBSRk95?=
 =?utf-8?B?NnV6SVBLc1dSU2luRzlDSGp0Ny8vdnVJaEVDVVZaVEJuSVhPRXpjSUpsT1N5?=
 =?utf-8?B?ZFA4YmN2dWg5VjVhTHhwdjZNYVlVNmIwM1ZuaFNoT1FNNmV1Y1ltQVlYdkI3?=
 =?utf-8?B?cmtGUUZqQmVDSDd4cEFHQXRVeWIvaFdpWDJMSU5IaTFGUkVBSUF1dlVzQmF3?=
 =?utf-8?B?RlIwNnhLRzZobW5yVU4rRkYzNnhNQjloTlhXckxUSUhmNkt0clRSaEIyQ3FH?=
 =?utf-8?B?NFZ2cWFVZ0R6SFBtMVJUcEE3MTFhS01YWERpY2JlRzJHZXRJL3Rxd0plb1Ji?=
 =?utf-8?B?aVFQMTRQMmdQWjVIOVpkU1B3U3V4K1JIbHFsdVMyN1B0Ti8xelVFZCtERk8z?=
 =?utf-8?B?S1BNaTVyaEE1WldhNkJScldiS0VZT2JWcnBqd1E0N0czN3lNcERZdHdjVk9n?=
 =?utf-8?B?VnBROEUrTXVoM2JVMEpKT0o3bkx1U0ZHdk9mYTZqWG1CVXV3QWx4ZTduQ3BW?=
 =?utf-8?B?UnhKWER0T1JYZ0Y4RmVlQ0tUc2dVOFQ3LzJHNFg5djU3b1VhRXlMVnBZMHND?=
 =?utf-8?B?dks3eDR3bHpHQ3pwT0k0enZtNFo1Z1htSklTWVk1bC8rRUJQMVdMejF3OHo1?=
 =?utf-8?B?OHdWSmZmUyt4Vzd2R1RpY1B1OW1IRmNrRjFRa0M0UU9UVmFjSmNaTCt1WUdv?=
 =?utf-8?B?SUpINStLVnlUN3ZwYWw2c2RYUXlxMUh2eGFTd0JpcGhRYWNNRkdhWlE2ak5K?=
 =?utf-8?B?ZHR4ZThVRDN6QzFrc3RRcmtkNlB4UmJ2c2ZJVSszSFcrVFRLM0wzZDBQT1NH?=
 =?utf-8?B?djYxTzZRKzVlQ2xEMTdxS2xFL0U4clZpaUNBM3VGOXhTMWVkTyt6UDI3Z0JN?=
 =?utf-8?Q?PGGIf4=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUUxVGdoTmIzM0NrcHUwcVgyd0laRmtzQ1dVSWcwL2tTQm5peko0aTVodjVy?=
 =?utf-8?B?emNhRVBTR3VQYzM1aHN0Qm9TT1U1Vnc3Q1JzMTdHTXZCTk9UbWxLT2RVamVJ?=
 =?utf-8?B?RXVhWE9Xa1FiZjJ3Q0ZPcXhyZGRBVTlvQUJEbnFERU1nT0psNWVTL1N2Tzc1?=
 =?utf-8?B?WkJadUV6TzNXQXY2dGI5UHVpYUcvK084MzRSdmpWajhFUVBIdUxPQXJ0MTBm?=
 =?utf-8?B?VDZ4L3JRWHc4VndvYWhVUjVzbW1BajFpRTBSOHlqS2Z0aWUxS0pEVFQ0V3lK?=
 =?utf-8?B?Snl6OHBXbll2YldjRmt1TzVrWVMyLzFpTHdQTVhFV1RNT01JRVpCT1JGb29N?=
 =?utf-8?B?WWxHazc0d1BrcmRQN3dFQnVwWHVyUThPYXZPbHg4M29BYlJDNW9KSWZkSzU5?=
 =?utf-8?B?d2E4cXBFR3pQZ2JKaktOVEt4dnlMTlRnVkVtQ1l1YTg5elUvQkZwM2J3RHJh?=
 =?utf-8?B?bkV0MFpNME5maHdxblNSU1VxOEJiUEdERlJmSnVrbGVRdktHeXZJTkdzN1BJ?=
 =?utf-8?B?Rm5qNTIzL0ZLOWs2YjVZRmRwYkZkSi8wSUV3RHdwL2V5S29kdGh0NlpBVklW?=
 =?utf-8?B?UWpPRk1qM3RTNmM1L29CVnZ0YzZyT3kraXZteUhiUmdmUnphcmNXZy9IOHhT?=
 =?utf-8?B?R3pGbkZHTkhsUjR4bXV4WndlNE14LzFCam9zVitpK0ROWjhES0xNU0JjUy96?=
 =?utf-8?B?MVZpR0dNdTZpckZTenVnTmJsa1RpN1ZzejcycStXYkQzZTYrdisyL3NoY3pN?=
 =?utf-8?B?R1NGQWZoTU5COXpMdUZ2VDNRMHdZTHFCQURpRkU4Y3QxTWxWd0swalRrdUNa?=
 =?utf-8?B?RWRKZGNQK200clVPbk13Y29PUEt5QmV5RGlZK1IvbTIxTEdXakdOdDRGRDQ2?=
 =?utf-8?B?ai9JL2szSjBmQkxjZHk5cjBBdk1iOVMrS1o2M0ZTaTNRV1pZM2xyZWdBMmty?=
 =?utf-8?B?dlZSN1NoazN1Um9hcWtLZXpTVWR4K210YWttNHFvNnp6ZlR5YzNNMWk2dUh5?=
 =?utf-8?B?ZHpBMWtCOEx1QXJYNU9HVkg4OEZUM01JMEE4OGFkbnZGbVlnVjlaZG5OQTk3?=
 =?utf-8?B?MWNTbENIaFh3QUM1Q3VTR01GN3o2K1dYbEdlTktrR29kNUN0SHdSR3M2T2ZS?=
 =?utf-8?B?T1g4RVRjWlp1WU9QdkJTbmt1cy9ER2xGVWpBSHYvZ2JUcktlSXVLSnFaUGxh?=
 =?utf-8?B?SHBSL2VtN2RoV0l2enRvUzZ0d0hXTURRUldTVWhrOHhPVUhEV09hUVIvMzl4?=
 =?utf-8?B?a0tyVE4vVkh6N3ZGUHhPYW9OT3YyL1NrT0xCRmlmKzlKUkRYdlZBSzZ3aUY2?=
 =?utf-8?B?R3FkYVY0d01DbDhjRmkzOXdmZlk0N1JBM2Y1Uk1hUS9nZGg4dUVUMkdpK2RM?=
 =?utf-8?B?L2g0VTNMc0lYb1hObkJsVTBZZFJaMHpGN1VtTEQrN1FrcWRDT0NyOVlvRVpD?=
 =?utf-8?B?STVkejZUSEFIelNENnVzVVdIN2g0QlRGVlhpUE5IUTFlZzBhMjhRRWZWdlFN?=
 =?utf-8?B?QlBrV1NERU1yZEl4SkpCZENuckxaazRRQ1llN2pGZU9BcXNicDhrSUw1Mnc0?=
 =?utf-8?B?TTRTWGFiL0VZK3paR1YyUUlTWHY3UWlOekJkMkJ2djZnU3owVkczVEdVb3Jk?=
 =?utf-8?B?RUozVFVmZU9RVkYva1JnenU4dTNha3ZPeS9LQUtkZzRjdGhHRm02YTZpQXZB?=
 =?utf-8?B?b2xHQkFHQ3J1WTlpZUp0SGRtd2lUWXM4MFNlMW42dG5pa0RlNXdKblhpTm9T?=
 =?utf-8?B?blNlUDVuWitXTmxaRDRaSVh6YU93Uy90ajVCZEQzM0RVQ2xLd2JKNEE0NUtP?=
 =?utf-8?B?VnY1R1FwaXZJQ3o3bWw0SjNpLzkwTi9wSWdnU1Y4bUw5by9KTm5YaHRqNlY1?=
 =?utf-8?B?V3ZCZDBpeVRncUwwTzJGYUFsTVVLaTZub3dFQ3lVRWtpQ3cySEFvdU95OXlt?=
 =?utf-8?Q?ud+dM8RRRn4IuRbon1WHagtdg4ZweWlk?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbd6acdc-0c87-4c54-9b8d-08dec30ab86e
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 13:59:54.8863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8496-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,outlook.com:from_mime,outlook.com:dkim,vger.kernel.org:from_smtp,GV1PR08MB8497.eurprd08.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 505A7648B9B

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

  Patch 3: Fix the duration prescaler formula and the skip marker written
  by pattern_clear(). The original formula (value / ST1202_MILLIS_PATTERN_DUR_MIN
  - 1) was off by one, producing durations ~22ms too short. Additionally,
  pattern_clear() relied on the broken formula to produce register value 0
  (the pattern skip marker) by passing the minimum duration. With the formula
  corrected, pattern_clear() now writes 0 directly to unused duration
  registers instead of going through the conversion function.

  Patch 4: Restore Pattern0 PWM to full brightness (0x0FFF) after clearing.
  pattern_clear() zeroes all PWM slots as part of the clear, but leaves
  Pattern0 at zero, so a subsequent direct brightness write has no visible
  effect until Pattern0 PWM is restored.

--- Spurious pattern sequence start during setup ---

  Patch 5: Remove the write of PATS|PATSR to the configuration register
  in st1202_setup(). This accidentally started a pattern sequence before
  any pattern data was programmed, producing undefined output on startup.

--- Brightness control broken while pattern mode is active ---

  Patch 6: Exit pattern mode in brightness_set() before writing the ILED
  register. With PATS set, the LED output is determined by the pattern
  engine regardless of the ILED value, making direct brightness writes
  have no visible effect while a pattern is active.

  Patch 7: Disable the hardware channel in brightness_set() when value
  is zero. Previously only the ILED DAC was zeroed while the channel
  remained enabled, causing residual current through the enabled channel
  and a visible dim glow on the LED.

--- Input validation ---

  Patch 8: Validate the reg property read from the device tree before
  using it as an array index into chip->leds[]. A value >= ST1202_MAX_LEDS
  would cause an out-of-bounds write during probe.

--- Documentation ---

  Patch 9: Correct and extend the hw_pattern documentation. The maximum
  pattern duration was stated as 5660ms but the correct value derived
  from the prescaler formula is 5610ms. The repeat field documentation
  is also corrected and the brightness range is made explicit.

--- Testing ---

Tested on LED1202 hardware via I2C. Register state verified with i2cget
at each step. Correct LED behaviour confirmed across pattern cycling,
infinite repeat, pattern_clear, and direct brightness control with
trigger=none.

--- Changes in v3 ---

  In response to automated review feedback (Sashiko):

  Patch 1: Extend commit message to clarify that the LED1202 has a single
  global pattern sequencer shared across all channels, and that stopping
  it in pattern_clear() is therefore an inherent hardware constraint rather
  than a deliberate design choice.

  Patches 3+4: Squashed into a single patch. The prescaler fix and the
  skip marker fix are tightly coupled — the skip marker bug was a direct
  consequence of the broken formula — and are clearer as one change.

  Patch 5 (v2): Dropped. Resetting PAT_REP in pattern_clear() is
  unnecessary because pattern_set() always stops the sequencer and writes
  its own PAT_REP value before restarting. The reset introduced a spurious
  failure point without fixing a real bug.

  Patch 4 (was 6): Start the clearing loop at Pattern1 to avoid writing
  Pattern0 twice (the loop previously zeroed it before the explicit full
  restore).

  Patch 5 (was 7): Simplify commit message — remove inaccurate claim that
  the SHFT bit is never re-enabled after probe; pattern_clear() restores
  it during probe.

  New patch 8: Validate the reg device tree property against ST1202_MAX_LEDS
  before using it as an array index.

  Other pre-existing issues identified by the automated review (global
  sequencer coordination, brightness_set sleeping in atomic context,
  brightness_set_blocking ignoring the brightness value) are outside the
  scope of this fix series and will be addressed in a follow-up submission.

--- Changes in v2 ---

  Patch 3: Fix commit message wording — programmed durations were ~22ms
  too short, not too long.
  Patch 7: Fix Signed-off-by typo.
  Patch 10: Add missing quotes around commit subject in Fixes: tag.

v1: https://lore.kernel.org/all/WA0P291MB03850F4E9B4EC7389FE89779C5052@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM/
v2: https://lore.kernel.org/all/WA0P291MB03855101311F0506B6448A8EC50D2@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM/

Manuel Fombuena (9):
  leds: st1202: stop pattern sequence before reprogramming
  leds: st1202: validate pattern input before stopping the sequence
  leds: st1202: fix pattern duration prescaler and pattern_clear skip
    marker
  leds: st1202: restore Pattern0 PWM to full on after clearing pattern
  leds: st1202: fix spurious pattern sequence start in setup
  leds: st1202: fix brightness having no effect while pattern mode is
    active
  leds: st1202: disable channel when brightness is set to zero
  leds: st1202: validate LED reg property against channel count
  leds: st1202: correct and extend hw_pattern documentation

 Documentation/leds/leds-st1202.rst |   9 ++-
 drivers/leds/leds-st1202.c         | 102 ++++++++++++++++++-----------
 2 files changed, 68 insertions(+), 43 deletions(-)

-- 
2.54.0


