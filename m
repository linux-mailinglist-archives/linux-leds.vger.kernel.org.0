Return-Path: <linux-leds+bounces-8675-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pxL8JaJVNGqbVAYAu9opvQ
	(envelope-from <linux-leds+bounces-8675-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 22:31:30 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B9A6A28B6
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 22:31:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=Cq6mPNDf;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8675-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8675-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5178E301F9F2
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 20:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBEF6346795;
	Thu, 18 Jun 2026 20:28:22 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazolkn19011038.outbound.protection.outlook.com [52.103.39.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A64A327BFB;
	Thu, 18 Jun 2026 20:28:20 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781814502; cv=fail; b=WfoAmvwlM/sS441ygEz2CEL9IwFdQ6wHcnAOnoMBgcWGnL/uZC+qwkIMUfQduu/QALe0y66GZTOOe2rHm1OkaWdkXMhb7m6iIL4tCx8uKpaWShMMPQE8xPuSXvniB93J0b24jQrvQeXM0wjTQY6xV+sHVEfWwGrXrqEH1ua2fig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781814502; c=relaxed/simple;
	bh=bJPMmHCKUPWdVl57mUkCdtwpcEDTVMiCuhm97Wb8euw=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=p0wlMjCj/SN4jXaFGplhCWEpAyEplLDrSQ5yYGb3s3z2EVGWsjuoI2pgDp75wwcXOr9EaeaYz68UarquriNWEhEKPzjMbhYWsfIGoHCx0LDPtbn2l5G/fDw8MDhH6L9iATH8OA+bDpw4g21ZFX8fcQPLSYaYReGw5OW/OeP+xBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Cq6mPNDf; arc=fail smtp.client-ip=52.103.39.38
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JMOjEo8xjt3NnNa2KvOUF4U5tAkzwBqiZbZ0ZgyCwpwvQVyG5yTucwyEkxaOpxsm/trgVFdFbPyNUUqS1OwGnLy5L3IYGHmd0O3VdrGKgf2kmcd2O19cPYPdGyv/ybdGXAwzTnAxi69Ro5YBsTsKBQTbBD0cz0KqvKnF6mt7PA+5POuExMGVDNScHmibDCProFm6CbopxnJdmpR6m9cb7JB+D9gugQTn+m3lrM698O6EVak5YCAz+p3cigOkubQtgnAXc8UOJ/vPmtvUUtrhALPO9NU7OVwEXCZ7xjAExb/UxvbBrZBPMjTauLwrCTpAfzVosBPKHz/hnQKo4iRxVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iki73RrMAj+SSDooOcBU0xgDEsNu9OmMOxX3XgazMh4=;
 b=sjJGKYPjzf9B6+lvLD4u3Togj4aJOVsoT3dA8GthaHppLBJwPzWettW9S8aTg/MM7Hd+a3+JVu3wozsFw7l3dTPxzsPSik9zNtNWK9xpByIH/4kKVCTT/36dISZtf8l9Jj5SNxhLLP81tzfrhKZYDP/BTQ5SnaHXHDLvyXOGZ85+SdJNHcFKuxYR7aKNMnicv23aUdSO7ZGCZEfSuffyYA4aFglLNne6j7H5VKb9DinORO32SlrDKGm6VLOK5dzBH1jH0Q+LVbyL3aPEnr5UakGGNhw80oYVMMTWD9/uaitAnjDdb60QTGi1xMRdxDCMxk6faNusnuByqsq4F1GIww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iki73RrMAj+SSDooOcBU0xgDEsNu9OmMOxX3XgazMh4=;
 b=Cq6mPNDf6fttKHEv6Py2iM/2ye45/JbBgtamWVJTE4ig0hDXfvKqw/d8GUskXwZjnnzpOLTx+4tglpa11AoEH2hGDFXOxxaQdjgxw+dGbQHcbDM3Bip1uplrN00pXxJ01o1XcqDD/hWaCXwSeaw2l9q2IEjNSKRUt/n/v4xAq4DtyTmsifFp+xGIOX+sQmJpSY6xY1zcRAaSdh1M4v68O6D7qORs8kMAipqJK7cFJTzeCVaOesCrQ/Y9BmNG491egZPeDINhyRcvb+1pSnbBhoaIr4bkFHbPjUFVXU1rUrD5WcXXyJsNjRqktLyDPHTFIspHc4lQ51qFdX7WS3q4RQ==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by PA6PR08MB10545.eurprd08.prod.outlook.com (2603:10a6:102:3d3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Thu, 18 Jun
 2026 20:28:18 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 20:28:18 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/9] leds: st1202: fix multiple bugs in pattern engine and brightness handling
Date: Thu, 18 Jun 2026 21:28:02 +0100
Message-ID:
 <GV1PR08MB8497ABC8E6AEFF8AAA1AF883C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.54.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO0P265CA0006.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::17) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260618202802.3272727-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|PA6PR08MB10545:EE_
X-MS-Office365-Filtering-Correlation-Id: ecd75f6a-0f4d-4735-418d-08decd78218b
X-MS-Exchange-SLBlob-MailProps:
	vuaKsetfIZn9IFDOZRHBr3PkJ6iE+FIkNIatwwPBEj89WVEVJoc8op+gRukdQiJ8fXK5mWZs40A0RHNsF7Txa/PpaT/D0PmNzIu+9zUyX+cUhoJdPLnXzRbPdxNJwWlJbjpRArKgkl5fSBwaV5eY4Ln49YAIPhyC8VNum1zg+IYwnCRykitmxmnDQ1o6O0dhfp4qxDsMa9Up0ixMs6w7yAOqJDqlSNno1GwO0qXS8dmWibY2s1l/svDDHuNwfq3TyDu8nWhNf46qwPJAanPcCuYeY5VAHUi6NDKcDm8XIlu8sVl0n2j5UxGGM/WoPH+5nXUja7rjEfkfUxrtP2KEboSWGB960RPul605Kt+uwkvkNYUyYqRvuUeweLP7HT+b+JLbQ5n8FAj1lDIPxxyCVCVJkEoBI7yNnZg97ZT73oKMp6+uSsvxYqk8+9W16wVSxB/ZUbbVQDNfiNoxDJR2I7uH05z/7tzSlXHBxPjfoZf1DOnO9N3DzEJTg6u2gTS740Ni0KAdYYfeK+MGr59dYxdxydiWHAKWU0gFOZW4Yns9J7ndnq4iwgCTVdsLcIJIKH7SLyb5+/CWCRNJYj1UClZEI5ybt/+AVxVT9zU9JS4RvFyU+TjmqSwr6i4HO9aFnvxnFcc+cJ8pwn4nobsoZ8Bl/xpvayZho4pM5zOj3Bq6h6UzSteVkJEYP3fSGJvFDHfzNsmoUkOsntXyzuj+4mkuNLjXcToZLipVQ4WN+crD2WKmV8fAg9wbS6rJr/YK/XEvZPBKa0H+iPn2jykjYd+iLTAEEhnwbnih5S8ENiBHftbdpyBd+aMusI7AyZP0
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|6090799003|5072599009|8060799015|12121999013|15080799012|23021999003|37011999003|5062599005|19110799012|51005399006|10035399007|3412199025|440099028|4302099013|1602099012|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dDBRWGpsQ3h6dlY5SjNiWUxtSGtDRUFKbXM5SXJRRU84RXM0bGdkTmNXSTNa?=
 =?utf-8?B?VEdBLzcwNUovUmpnbS94M1Z4SGdlN0dZVmJJVnJuS2M2N1NSRE1BR3VWeXht?=
 =?utf-8?B?NjlLTnJDb3lwOVMxUmhpQ0U5cG54YnpQa1JOOEpkYXBxVk5lM0tCSWozZUtw?=
 =?utf-8?B?b0NmWVlOcTAxMjU1R2Y4SHpqaFQ1amhDdGdzK3NwT3JEc1VwczdXckk3Y1Z1?=
 =?utf-8?B?OWpRYzErYURCUTRydkh2WkFha0J2QXk5LytKb2NFd0hwelNMQ2gvbzM1aE9H?=
 =?utf-8?B?UmtSWDQ5U3hQTXBaUHJ6NTQ5T0plN20rTHhDSmZjckdmYk52ZHIyUUZtcDVM?=
 =?utf-8?B?MGRFZndFQmlIZlUzNS9acG1LcFVVRGZKSzdmQW53aDN6ZnFiSW9JS0lPMXBT?=
 =?utf-8?B?dk5hVW9zaWx1eG1VeGhVTzBLSS9xZUtSR3dVUDB1S2xTNUZZbk9RUE13a1d0?=
 =?utf-8?B?Ny9QRGtKbUpRaUM1Q0JVY0pJUHBLRG5QY2VRZk5BWVJoV0ZQRnU5K1RieUd6?=
 =?utf-8?B?WXVJK1VTWTVsNTFBMys1K2pJakRVSXBuNlVsT3E4RzBSMlRmME1RSUJLOElU?=
 =?utf-8?B?TnFhUU1aVys0NlNtVDVMT0U0U3gxOTF4aGZWV3RlSWR4VWdDTkNMT3RCTmtn?=
 =?utf-8?B?VEIvRFowQ3RJdkNXRjRLbGN0b3RQUlVPSCtmOW91WFd2Wk4rZE9VeEFGL29Q?=
 =?utf-8?B?MEVBeUdtZVB6TWNId0drdHNtM2V0TmJ0ZW5lZXdVYm1Sa1pvTDZuZXN2aUQ4?=
 =?utf-8?B?NUZCZVFUZ0dMQ3JiUllnWVQ1MTZTTmpLSWUyM1RCc2poZnFTK2hZbld6RXBW?=
 =?utf-8?B?NnNjRklPdUlRWUJmcGRJQk9Rc1V5VW5LSEY2MTB2bjhKSGFKOHhyLys5WlFP?=
 =?utf-8?B?TGpzZUE5bFViQ3I4QlpSMFJ5RC9ETVRyWjEzaE5vRitvUUVqZ1lkZFNJRjRP?=
 =?utf-8?B?dlZyeFluYlFHcG45RnFUa3dIRFJRZEI3a09FckdSR1ZZVWJsZFhmV2FuUngx?=
 =?utf-8?B?bUluOHhhVzkxdzdaY2E2RnFSeGJWRU4zNm40b2lVaEJmUnVpSkM3MFdUN21D?=
 =?utf-8?B?UmVYVC9zUFdNMS9DQTkwUG1JeVRWNWM3dGR4ME1QVTZ4bGZNWFJlSmJ3TTRB?=
 =?utf-8?B?TkNZd1pWQjdXNkZRa25OdUhhS1FJcm12WWRicDhYblVUUG5wMVBPM2wzWkd2?=
 =?utf-8?B?UE9TT2s2ZkNweDVtU1E3NGJUTW5qTW56RTRVcmwzZ0p3RjNWdGJoM2EyYmJ3?=
 =?utf-8?B?U01ia1kxYlJjMVpLTWZLVHFic2pNRkZncTc5dHBEV3F1d2hLaVdwRllPQVc2?=
 =?utf-8?B?MWRLSnFINVk2bjFRL3ozZTlXVUlGbnR5Sy9sQzEwczdVeG9xSFpFeWdXaWl2?=
 =?utf-8?B?WWZyQlpyRlQwYW1NaWtVMUV1d1FmREJXV3RhTlhLZjEvMmFsc2h3eSs2MmVk?=
 =?utf-8?B?dmpuSWVoSjhHSU1HY2JGYThQckVPT3dHS1dKZlc2ek5iQkE0bFBqTDNoeVFk?=
 =?utf-8?B?UVgxZ1dwVnpZdEQyZUZOREY4STNxemYyZDBKYzNuNjk1bUxVR2RlQnVMT2dr?=
 =?utf-8?B?OTNhdz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REhubVZNNjFqOXBmYmdXcXp5cU5uTEh3UGhOMFdKQ1EvVGRtbEdIMTg0elBR?=
 =?utf-8?B?M0dkMy9ndWYwYzdYZXc5UlljUTlJMnpOaUFkb1hSVXhwbFFnaE1aMnp4OS9X?=
 =?utf-8?B?b0RsWnRMVTZncVJubFNUbmRpYVdjOHVMSnFLSzU5OHhGVmRFQlptSTdUdXBY?=
 =?utf-8?B?RjdnZW5JanZKV1J0Z1Z0ZHM0cWpLUXlnTkFZc1U0aVNtamlkRG5tdzVTclla?=
 =?utf-8?B?UE1NazlrQXJEeURuM0xOQVFmeVlheGtCWncydndlblUvVmZPNkYyeTVqYVZW?=
 =?utf-8?B?M01YeFl1b2JNY0dUdkJoMmNxZVg5cC9rMDJLWlFCdHhNd25relBnYjVEK3V0?=
 =?utf-8?B?bW5WY0JvQnByZXFUa25IZ0JkcWl3eWxvbmlmUU05TmUrVUxGVWVkK2M5T0RT?=
 =?utf-8?B?ZmV1MlhOSVE0RVZMQVA5b3A2Ty94bXhla2Z6QURVQS8yWEhucXk3eGV4YWhk?=
 =?utf-8?B?ZFFkNUIvcFVuMG5QcjMzNGJLRFl4SzhjNTFXRUlmTVRGSkp0YnhmcW9rQWRR?=
 =?utf-8?B?WVRkVTlENit5YXYyNTgvb0hqOUljenRvbDN2bUJUbThRbWkxVi9pMjNNOGhv?=
 =?utf-8?B?Y0RIaE5ybjhFK3AzSUlOU21oMjIrZXdEYTJycGdHMHdMWVVFOUZRa1VXaHgy?=
 =?utf-8?B?eGRseW5INnJOWVZFTDJGQ0tuNVZ6Mi9ZeTYrOGZFQ20yOVVnZGY1Nkt1aGg5?=
 =?utf-8?B?NkJ5V3VrMlNpT3NxZlY0ZUFWZU5EQW5kd2dHL1RzTGVTSndWRDREbFJ2cjdD?=
 =?utf-8?B?cmtobERUWkIyaTk4UXJsZWhFMEg0SE50OWpBV2E0ZVFmSXpaYk1TVDFLeXIr?=
 =?utf-8?B?UmFIZ01OVGFNOXdNNkdpNEV5Z2hCVWRSWVRxdFl6U3RnMHVzMkRnbU03YVhs?=
 =?utf-8?B?ZlBsSFpqVHliVm5aWW8ySzMxOHQwUU5pWXZRYnE3SXVuVytjRGMwYzg1OFBl?=
 =?utf-8?B?N2hVR2E5bG4vWU9EeG9vRkM0NjRUbTdGcDhwbktOakNYUlBFMVRLUFJNVUJz?=
 =?utf-8?B?cGc3dmszZmpJbEx6UTc2L2I3S1VPdFNZR1lkZmxYb0QwL3VjL084TmlEUmlt?=
 =?utf-8?B?eFhOVVpsdksraWQ2c1drN0dxRG1lRi90bWJYTVhtaFVDSE9ZUUVQbU1ZQmNC?=
 =?utf-8?B?VnAwQWJqTGt0UXFpOW9laDRVa3FKQzgyMldFMVNTdHVvTGJjQnJiK095bGE2?=
 =?utf-8?B?Y0lsU2ZWV1FGUTJ5QjJ4WHFvVlB4cE1VOXErT3VkZmlLdlV2ay9OUXZRNVE4?=
 =?utf-8?B?OFU0cE5ydGJ6cGJ1UjRIdFJoNDdCbUZmWldrY1Q1RW1KSlBOSE9CUmVNMWYw?=
 =?utf-8?B?MUNDa3JjNFpxMzNyK0FnRkZWZnIrRTBvUWxIa2JtZUcydjd0ZmZ2QldNd25N?=
 =?utf-8?B?bkRUTHdEY05sQWFyNEphbzk1TFdXRU9RMS9PNUNMREZBbEh1bWY4bmgxRnRq?=
 =?utf-8?B?QnVHRFRvU2dXRkMwMGR3TEdFdWFOZWtja1ZkSENUU3dSRTJpbnY4MGJ2amdl?=
 =?utf-8?B?RThHdWEvQjlYNE1wS0I0b1dVWGwyZ1I1WkxWTGxxZzlqaXN2NjYzcURoendB?=
 =?utf-8?B?RWhnY2c1Kzhlc3doRzVpZmJ3Q3F4cVA1U3Z4S3pLc0JETGpYUWxDbWFieHBC?=
 =?utf-8?B?UXI5Z0k3ejRnVlNoODRNNDhFRFFlTUdXSnZVK0pqQUJuNlgxTk54b1pVQWNq?=
 =?utf-8?B?aEVqeHhpWmdVT2xEbnd3MFhDS2ViMlgxaHlkazdFWVgzOFF0NWtHemJvMEs2?=
 =?utf-8?B?ZVdLREhoU1lWV1ZqYnBNSm84QUtZQlFoL2ROQnoyTGp6UnRYT2x3ekRiblpv?=
 =?utf-8?B?aWFLbVVMU2p1eGpQdkRUaDV2UFZjaFkxT296QjUwUkRYNkdyQVp1VitRZ1po?=
 =?utf-8?B?UnRCa2ZJRTF3eTJwTEFyR0o1L3ZpbzlvNDdQbGRMUkRqOEVpMDk5SDdVckZM?=
 =?utf-8?Q?Ky7eJUmO324UbXpYq1UnsFfiFftQGfx0?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecd75f6a-0f4d-4735-418d-08decd78218b
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 20:28:17.9956
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
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8675-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,outlook.com:dkim,outlook.com:from_mime,GV1PR08MB8497.eurprd08.prod.outlook.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E5B9A6A28B6

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
  and a visible dim glow on the LED. Also restores Pattern0 PWM to full
  duty cycle before writing ILED, so a prior zero-brightness hardware
  pattern cannot leave the channel dark despite a non-zero brightness
  value.

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

--- Changes in v5 ---

  Patch 7: Restore Pattern0 PWM to full duty cycle in brightness_set()
  before writing ILED. When PATS is cleared the LED output is
  ILED × Pattern0_PWM / 4095. A prior zero-brightness hardware pattern
  leaves Pattern0 PWM at zero, causing brightness_set() to have no
  visible effect despite ILED being set correctly. Found through further
  hardware testing.

--- Changes in v4 ---

  In response to automated review feedback (Sashiko) on v3:

  Patch 7: pattern_set() did not re-enable the hardware channel before
  starting the sequencer. If brightness had previously been set to zero
  (disabling the channel), the pattern would run but produce no light.

  Patch 8: reg was declared as signed int but populated via
  of_property_read_u32(). A device tree value >= 0x80000000 would be
  interpreted as negative and silently bypass the bounds check. reg is
  now declared as u32.

  Other pre-existing issues identified by the automated review are
  outside the scope of this fix series and will be addressed in a
  follow-up submission.

--- Changes in v3 ---

  In response to automated review feedback (Sashiko) on v2:

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

--- Changes in v2 ---

  Patch 3: Fix commit message wording — programmed durations were ~22ms
  too short, not too long.
  Patch 7: Fix Signed-off-by typo.
  Patch 10: Add missing quotes around commit subject in Fixes: tag.

v1: https://lore.kernel.org/all/WA0P291MB03850F4E9B4EC7389FE89779C5052@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM/
v2: https://lore.kernel.org/all/WA0P291MB03855101311F0506B6448A8EC50D2@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM/
v3: https://lore.kernel.org/all/GV1PR08MB849762937DA5B82DC89F1CC4C5112@GV1PR08MB8497.eurprd08.prod.outlook.com/
v4: https://lore.kernel.org/all/GV1PR08MB84976A49601E78A47CE5D83EC5122@GV1PR08MB8497.eurprd08.prod.outlook.com/

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
 drivers/leds/leds-st1202.c         | 110 +++++++++++++++++++----------
 2 files changed, 75 insertions(+), 44 deletions(-)

-- 
2.54.0


