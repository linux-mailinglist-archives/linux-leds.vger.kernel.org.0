Return-Path: <linux-leds+bounces-5047-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07317B02AAD
	for <lists+linux-leds@lfdr.de>; Sat, 12 Jul 2025 13:47:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 966D34E61FD
	for <lists+linux-leds@lfdr.de>; Sat, 12 Jul 2025 11:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD26D1F428F;
	Sat, 12 Jul 2025 11:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="G6WQPOy/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RPvO2Cbh"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2732819AD8B;
	Sat, 12 Jul 2025 11:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752320844; cv=fail; b=RwxbV36jdsIeqeDenCTMFRrZPCscW7lQpoP23ohRL9i6Cxx9yJw2eu8iQ0xkM0zhhsVw9pmTjhtZFpLHBKbY55s4iZgca29iq+vSMqC3W3YICquasuZ6QGlNlGYfuBScziBysKRFmCdtsvgU3kidtl8oCI+zuxC9BGMMfCzxT6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752320844; c=relaxed/simple;
	bh=FPr8mjaivKeU3ZpLSIgIkXmc429PSGyFvcOi1pK8Tv8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HXBG4k5I1tdyDeRlyQcE9vN+Rn9EfNbPVqJjVWkuG6fb6GnVTz9nbbmq8Lh7puKNsLbM3Id0SNtvpDKJEq+oMmcUGzQ6p/Bj3KVc5goZvF+twwGDC5oD0gbB9DoXVzgBDq7uuARkegd4Ypl8QPqn1DTA2AS0bf47nM86/+Q5opA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=G6WQPOy/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RPvO2Cbh; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56C7HX3p000958;
	Sat, 12 Jul 2025 11:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=/uvA+S0rQf5lOLmq/JkHycpgeGAS59z/+sjHdGtUvnU=; b=
	G6WQPOy/Ou7GQvhSUah4Av6qCnhOZJIuKC7cU7d1X3/0jVUbFpce50sH3UyYkLhg
	sk9zB7+Nh7mSVXevW1qniPvGy8m/oIV6pP8sp0kxv34kGLNI1WzdfGjH2r1nfBvo
	b4/Jf9001i97op3iXT2ScbDOClbCsyBABDPQ9NPgY0wjbvNskUNTur4jAeF/2yt/
	mFlEkNcFSCkw4YUAu6yvm4lhZ3jU2Xky4BOTfV27FwJgTakO0/9WI2lmvf+pXRqM
	bExL7GfomMBf2YDkgpIRsa8D0092oB/DgrDcRbcI96fbRun9pVmctakLY7/Av0j0
	7Bt3qlr8Q0jO1lGdofmwCg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uk66rrtr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Jul 2025 11:46:52 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56CA0Ugu011729;
	Sat, 12 Jul 2025 11:46:50 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue57294b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Jul 2025 11:46:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=InqhLYKSWCdqUkUFN/F6efxo+ZfKszLZTEvwWhX4yGAfVI+sirzJyA5LDpf57N/HUOpSFld+L+UyUa77NIR8101PvSjhINtryWElp9NUaHibyBWLewmu8UGY98muU34blWhr5nJnh7lIzvRSqWrtrUVRhGG+RjXA0OKyUX6xlzVt/Nu8scPYOtnwLy6mNEH7M+t/LCR6g9hIAJqQYhN9mYHZt5GadapnqhsvU9zch0KCPNYw1FB/wiJ55LgCjCHLM+Xzw8gzBlhhgyUF473mycuoHvwZHVxhqU9VvDhHVqUSKgoq8TqFcHVBB+h+nLKuQURSgdjsu4ekre8tgh/4+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/uvA+S0rQf5lOLmq/JkHycpgeGAS59z/+sjHdGtUvnU=;
 b=cPAdtnNrpXwStvvBdMrtfyRvl3ApaoxJJBwjpwu/0QzFsoachp0d5zieX1S1KDv1UTxjASOFfa/2MfJqnLaJbshPFU9PWx6jiPrrxNB92mwNtpOdNai2Ys93+UyE6H1sxXtddoi2gGA9+UVWuJJQ0LmMJMOknFkL7Bvbyraq7RXA/MWdN1+IF9RDfIJIsU14TcCci9Tk0U0OXcKxdgMju2MJ8unAiE4Mmy5hWbnBQ0SoNAjdlKl62cDM4BmnWW1igtAd3jNxVFftYXdUkQ9NAQrOcW0MBm2wuZp836Ksap5oBqtzTNHf2e+I22hTo69bauFlH57RqQ0h1tY2KEWMiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/uvA+S0rQf5lOLmq/JkHycpgeGAS59z/+sjHdGtUvnU=;
 b=RPvO2CbhhmMy1ZELCyHW6St2NJEyw03lucdW9+kozxZlyIGBIAZwc85gxSttJzArbNj0f4TpWJTeWa9LdygVJaoTs3sWn2UWkaV8lj9cNmXtl6CJi+xsam2NkyirY5NQOjlL5JxWJEJyt3MNa7ubjLukOP23kn8ZPhsBkIcVZ0U=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by DS4PPF0E620229E.namprd10.prod.outlook.com (2603:10b6:f:fc00::d08) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.38; Sat, 12 Jul
 2025 11:46:48 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%5]) with mapi id 15.20.8901.028; Sat, 12 Jul 2025
 11:46:47 +0000
Message-ID: <2cc8f650-e917-4bed-80f0-e74b37a426f5@oracle.com>
Date: Sat, 12 Jul 2025 17:16:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [External] : [PATCH 1/3] platform/x86: Add Uniwill WMI driver
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com,
        hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net, cs@tuxedo.de,
        wse@tuxedocomputers.com, ggo@tuxedocomputers.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, rdunlap@infradead.org,
        linux-leds@vger.kernel.org, lee@kernel.org, pobrn@protonmail.com
References: <20250712112310.19964-1-W_Armin@gmx.de>
 <20250712112310.19964-2-W_Armin@gmx.de>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250712112310.19964-2-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0005.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::6) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|DS4PPF0E620229E:EE_
X-MS-Office365-Filtering-Correlation-Id: eb228a91-9544-435b-e05d-08ddc139c818
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K0M3ZUk0OENaWHBOQmVoSEg2dVdabDdpbHZWd09nNnNBTGJ4Rk41SjdZNGdY?=
 =?utf-8?B?TzdVMmpGK2djd0I0YThtVURqNVlaZUd2a3Z1WDE2ZkQ1cElDNXpFN0VBVnlt?=
 =?utf-8?B?U1c5Qk9acmgyd2dOWHJUSUlqRkg4N1NrWkZZTjVQN0Uyak5sTHMzeUhaZUVP?=
 =?utf-8?B?WjhEY1hLcVBGUWRXWTFmckt6dnhJMmFpOUdqSksrb2dic1JpdThlWllpSWtR?=
 =?utf-8?B?MER1RlRJTVpKc3FkK3haQllYWFNIOWp2YVRuZDVoaW5VKzVzN0p0M3d1d2hj?=
 =?utf-8?B?d3RlZ2hCdmZ3L0pBNTVVTW9DYWFlcC9vdEFVSFdxTERuMkgwWlczYzhZTGQ5?=
 =?utf-8?B?emI2UjFwR0RlSkIzSTM3R05sdGJWRmVLcFZodlpRZzVWcFcrK3MrdmRsaWR1?=
 =?utf-8?B?eTVjRzB1aENRUlFPeGRBdi9KVDdHenNzc0I4ZHJIZHU1M0dMOGlORDRNRUd1?=
 =?utf-8?B?TG01QTRqY0tGUkJhN24yK0h1MjNlRGE2b1FPM01RYVNqQzRZWG8vcDFrTG5S?=
 =?utf-8?B?bDN2QUZ5TmY4WFdOUWRDVkJrQmxXZEFpME5uNkttQXlLRndvT1A3c1dDQi9H?=
 =?utf-8?B?bHF1L200c0ZvcFRPNkc0YUIrVkQ5Z3ZyZE5LWTV0aFFJcjRjRDhkcVJVUEtn?=
 =?utf-8?B?b2tmemVucWtTYVhjc2psRzBzaU1UeXI5Vk1NbTFjVHlETWhxcW5jSDV6bGto?=
 =?utf-8?B?ekIxemlabzVuRzVZS2R0VWR4SnFWYnBLRWI3ajFEQVRXTWN6RHlkUkhhUjBT?=
 =?utf-8?B?aVdDV2x2SFRweHdlYktJcnoyWkoyM1JnYnBkMkFnQ2lzaVo4RytyZ1RwWEVK?=
 =?utf-8?B?Rm0rMEFvS0FITmZlQWNpd0c3WE1hN2pwem5RL0hZaUVRMXJCL0tiOEI0UE50?=
 =?utf-8?B?OUtHSFg4SmZXLzZROVJsdVBQUDFxRzBDenovWllUTENxeklUbzlUd2tBcUFW?=
 =?utf-8?B?VHplNStVZkZmMmVGRWR6QUw4Nkh4Nld0YUVpVUdpRGJCdVJweE9PYThYcTh4?=
 =?utf-8?B?Z2dpR1VJUGlYY2lFN2VPTVFudWFlWWVVQ0MvQTJua0I3bVk4cEE1cGF3cXFM?=
 =?utf-8?B?SmxhZWp2UmNUcjlPTlAxVEtZUEwvcWhrRWVxTnJ2dDdlRkJ4dUI5UWdkMEhS?=
 =?utf-8?B?ZWhMYTlDUitnUG9QK1hkaGNVeUszL1c3K2lUbWhSUkFHM2FjTktEdDhmR1J5?=
 =?utf-8?B?SE53ckNDb2VlQkNwMmxaL0w5eTRjMFZIZ3JZZVg0V2xXb3Q0Y2xJV2ZGVllz?=
 =?utf-8?B?U0c1V3BJQlZ4NlM0aUpFeXNmM0RIWTlIMFN1M1VJZ1VtdU1kSFdwZUFmRlY1?=
 =?utf-8?B?VkRIclJzdE9Dc3VHWkV5R0IzOGJBRzJpZ3d1UFhSZEJMdC9IWGhFV0NXRjJ2?=
 =?utf-8?B?YjMxbG5yUU5LbVdkaGZVR29sQlgwTUFPN1BvZjlGTS9oV2M0enVLRmRVU2V3?=
 =?utf-8?B?MHRSeU9rS0d0RUtJTGVYd1RMZVl4ckZsZzBoSHIwMDl6MExNa3ptQ3ZMbmp1?=
 =?utf-8?B?UHNRcU1WOW5CMGRHOGZwNy9xdFlrSndmRTZqUnVOanM0ZVJBbEFURWxBb3BH?=
 =?utf-8?B?bGpnUFV4ditOL2U4Y21jcDNSMmozbmhUQmwrd3hoa3ZkWVpIVCtneURybFd0?=
 =?utf-8?B?NWFkL3hMalB3KzhEWDhYVm4vdXVwbjI0YmsxYTBlWXR5aitOQzRkUnZvcTU1?=
 =?utf-8?B?RmhXOUZndlJMV0tIZFFURHRheHhWSWN0emc1cERQWVZCdHJ5VFVlYWROKzlD?=
 =?utf-8?B?eGFKT0hMRVRiYzhHaW45WXpPc2dSdTV1Q3Y3aEtOL0hVYWhHZTFwa1htWVFt?=
 =?utf-8?B?UFRNUFRwRGpnak1XTUdtVkVpc2o1WVpEZVR1KzVwT01yaGJrTnE1amV6RHlC?=
 =?utf-8?B?a0hpd2tNajJ4dVJXMEN5bjJEM1FGdUxRV3hOSXZmNG8wclE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHpGMzBrRVNYbWNFYkF6cm4zR3M4L3VwUVo1ZlRQRUx3ckJ3blN3OUd2UzAv?=
 =?utf-8?B?cnVrdFZOcit3UVk5L3ZKTVErSzViUStvMGNhM1d0ZC9ja01vbEhIaCtQdkpu?=
 =?utf-8?B?WFV5SU5Bb0llQ2RBeFRkSFYrTHdmT01nNTQ0ZVAzOVd1UVB5Um5GZHdsVnhX?=
 =?utf-8?B?RlR0UTY5NVNtUFNRYTNobUxWcnVYTnBKNUFNd2FiMFlrRnRvbzZKb0FROE1S?=
 =?utf-8?B?OHhVMWc5eUFEMDJtakdHd2ZKWFE5SUU4dTVVS2MwWmxyMTdHODVHMS9WQXlE?=
 =?utf-8?B?N2FtNC9QdUJwekduM0tITU9ZRU55d0FHMzlzc05PS3ZXbUo4WS8xWHhhdVU2?=
 =?utf-8?B?MzBTU0xiSTJZRVdYdWxhR3dSbndDb2xmNXZaWklhK1hscU5MYitDM3lhbTJo?=
 =?utf-8?B?d1pmc0Z2cnBCNFd4M3lyV1I1Y3dObzBkcWU3eUxRZGdTd2dVOFR5WkZLMWI3?=
 =?utf-8?B?eEFOcjI1dC9pd2RnWGFQTXpFQzJ3RnM3bnhqVUEzVk5vTTJ5VFJzYTJDZE1h?=
 =?utf-8?B?QlVVQ0FUOENSTDNFTDJ3K2FBaE1iTnBBWjB2bFVhMWl6azVSMGN6UVA4Q1E4?=
 =?utf-8?B?U2lWeTY0YTBUVWlkZkVadnozN2NLWCttWkdjek5KRnpBQ2NkdlJha0RCWDhw?=
 =?utf-8?B?YXovdHdoeWNJRmc5TVJxcmh2dHprbEtHR2NRNVZMeFZYbHJ5RHhqZWFBeE5X?=
 =?utf-8?B?aUVpSHZFNXpjNU52UG1EL2VQckR1WE8rV0J6c1ZTbUYraFRtNE8zMXl4ZmVG?=
 =?utf-8?B?YzY1RmNuMCtPQnI2UHBWT0p5SE9IWURhdXFSN1R2UjRQWld6MTlXWFBxQ3JZ?=
 =?utf-8?B?Rk5KQ2FrODZBdE9zTU56STRvLzFweW5ianR3N1pxeWo4MnoxeTVuOHoyVjdr?=
 =?utf-8?B?blY5a3ptaUVyeDMzcGFtdjVUVURySXZMMGxvcDBTZHpMRkRQRUdwQXpBVVpv?=
 =?utf-8?B?OEFIZzhHKy8vTXNCajJQb3hoWS9JN0xDZ2luOHV3ZWJDNTY3bklNWVN2RGlX?=
 =?utf-8?B?d2w4MzBjY2t5ajB6MCtCRVRvbDZnSWR1bUM0dFBzZHpFMFpkSHhVZmxyR3po?=
 =?utf-8?B?ZUlaMnVXM1JuSWlwRG02bEhZbnRUcjA3a1Y2elFUL0NHMVdnc0dVS29qbmhX?=
 =?utf-8?B?RWNKaFBtT1I1N1d5ekZTTUcraDdITGZGSjgwbUN4UUVQUVU0SW8vaEFDb0RW?=
 =?utf-8?B?ZmsrY1hMdUxEbGRpV1ZIdWpGYjBTdHdrdzJGd2hvd0dPZklWazB2WnVJbERB?=
 =?utf-8?B?QkVSMnhjWmdLVC9EVS9HTG4rWHFlTFlZRXk5VVZacDhvWTJXRkVzYzVjaVpO?=
 =?utf-8?B?RmpxZ1FiY1NBcldvVkUzQjYwSWpGelIzbmI3bUt3akZLQjJ5SGU4VWlDYWh3?=
 =?utf-8?B?bkQ0T2lSbzNWcGl3ZTE4b0pxdXFabHNRY2czd1gwT1VQcXZZcUEwdC9qVEJx?=
 =?utf-8?B?QXJrZ1FYME1BZmtHYVptS3Z1ZFJyNFNEQis5Z0lvb1FkTXBJWVk0YmMyVTcx?=
 =?utf-8?B?ZENObXJaYlFJbnVSYno1MWVtNEcyNG5CSWRNMUNNbkhNeHpGRnV5MmN0RDdS?=
 =?utf-8?B?TDZTQmNSK2htamtoek15WUFPQ1lKbFdjSnFBZ3A3N3F2bEdENElzR0xEU2Jx?=
 =?utf-8?B?c3Zad0htcjRJRk1qblFTWU05dGplSGd3a3F6SUYydkhBNUVLdjluQU41bHFw?=
 =?utf-8?B?Rm55OE1zck4yaVZCNy9vbzBFcDF4d3lmTStVQnhDNW43ZHJRdEIxdGc4UWkw?=
 =?utf-8?B?ZWdES0k0MW9HNmtRdTFabVZKMWVKT3JPSFczemkvTjJ1NW9jcXFsQk9oVmJV?=
 =?utf-8?B?bWFEVUlYaTI0YVZGbFVzM1Q2V3lOSEROZWRHQ2MrRys1MHEyOERkZVA5OVhl?=
 =?utf-8?B?SnNVSWdmbU1CdVlnZFlKS05xZHRLaHJvZXllNm5FTGNTK1k4dlJaYVdBeEd3?=
 =?utf-8?B?ZEFzcG1GRE1zaW5vdzd2REI0Q0xLY2xmZmQvdGFNZ3BjZHFMandPc0VhOFcw?=
 =?utf-8?B?aXlXR3NreHZRemR2L0xUb29aa2svVXN1aFNidjRZZW42YVJMdGE4RjBON0xZ?=
 =?utf-8?B?WUppbmliaFNta2l3VmlOazF6OU0wTTRUZWhkbHBCMlRrWllDS003NXJpWEtV?=
 =?utf-8?B?WlFCMHhsVENZZUp3Nk9heU1GcVUwVytrdUM0d0pwd3FkQlRFRDBGODByRWww?=
 =?utf-8?B?emc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	m0r3sPB8LgP8Ej77VZwGtIUASvaUeUyFNUNo/mMGF2lnqdrJ8L1KZaB0WDfS0J2euR4Mh9IzdxyOnZL9MMFWLoA/pVXSfZ5bm9AI/D4PI0wBOjorFfN5wk68tqBRmNfCwTNNUC7W/DAQZL5BB3qBHhgG9b7Tdk9g56aBKyxysyQMoD5IQcYvEPvVFtdsfs63uf7VF2nRfchbPCuAXQgtbLirAiLE57EqzAmI85hyTvML6vc97KVjYM/3OmQeZqOcJm94q0zmGb2DavDruX1a8MyHTY8jn0q32zfwlxRDwrYdJgfQm0epxC1t3MF0EzMWAleqkpLrp8YJ/kvPopjj6/6v6RJkEP0etOdwGjWWjMc4Cwa7y97uB8fhP8WZHJmJOBfPMwSZsOYItWEDvJsNh2yz1zNTkVvTjA+AIM7x2YvR9Jeb+vmjuMMRI2jsqiYDRmQYhEdhczyFXtgaX0zXcUnESECZ5v2SmsI097kgN03g6ncsJrP1ctZHKUVtpZp7SXPsy1kZK6WTsMr90TKqRv/0+iu0oSRS9dZqhwTqgSpspEYWGZAJYEbPHUioGsdpAEpmtEikLQtWl+Mb1mSK2a1AfAlYZJjEvD6DUEZPenI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb228a91-9544-435b-e05d-08ddc139c818
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2025 11:46:47.2243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GEOxAH/cH78ZH0PedK+rDN02RMbSRVUxd1OD94YLGE7d05+KO5gqNVnj5ULIkh5108tlJMdRT3vBjDOmeHK+yq9wjlGs9xnHe5G72btOYC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF0E620229E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-12_02,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=977 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507120091
X-Proofpoint-ORIG-GUID: scm9uA235XD8V62eoFp5Vn_-iyP5mF_W
X-Authority-Analysis: v=2.4 cv=AZGxH2XG c=1 sm=1 tr=0 ts=68724b2c b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=SU50tXB9HMUeb8gS4U8A:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12062
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDA5MiBTYWx0ZWRfXzV+IlOcnpni2 40uz06beGpPcwn1C6V7BHRF5I6jaunM9YMjgFUkzS+YPO3blgN61LQJ9DoXMKAssEX2iyIW2UCT jIogOsRxNcBQCcucE6/YL/741/QtSCWdz8a+9D+shWwftF8SnI3KK+bmLlgb/ksnW0gsQzu/yRV
 r5GDLU9y5hX3I3tmrb2XW4okQ/HuEifzrO4mtA3rqthUoK2WNid74P9tdvBUtZXXlkPWBWzdI3j ThLs8a7slMnTErnD3gE/jYdRtg+mgJB8d3/WZAs/UvpAjNaDMIi+dl6LJWD7E02SekAWAXV7ShQ 1kzT1duMhQjPZZCBD+FdlaVRuDfsAdGv6Q5g1/0El5fEYWoEBK4RzWnjRK35J/SVjDN8ZexAeQF
 Sgk1XrJV8CeebDBjjO1UQ3ziozlndGM8cyPqd95+F1GYGvb8yVzeS7IyQTykdckFLQ4TzLeg
X-Proofpoint-GUID: scm9uA235XD8V62eoFp5Vn_-iyP5mF_W


> +	/* Reported when the user locks/unlocks the super key */
> +	{ KE_IGNORE,	UNIWILL_OSD_SUPER_KEY_LOCK_ENABLE,	{ KEY_UNKNOWN }},
> +	{ KE_IGNORE,	UNIWILL_OSD_SUPER_KEY_LOCK_DISABLE,	{ KEY_UNKNOWN }},
> +
> +	/* Reported in manual mode when toggling the airplane mode status */
> +	{ KE_KEY,	UNIWILL_OSD_RFKILL,			{ KEY_RFKILL }},
> +
> +	/* Reported when user wants to cycle the platform profile */
> +	{ KE_IGNORE,	UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE,	{ KEY_UNKNOWN }},
> +
> +	/* Reported when the user wants to adjust the brightness of the keyboard  */

remove extra " " after keyboard

> +	{ KE_KEY,	UNIWILL_OSD_KBDILLUMDOWN,		{ KEY_KBDILLUMDOWN }},
> +	{ KE_KEY,	UNIWILL_OSD_KBDILLUMUP,			{ KEY_KBDILLUMUP }},
> +
> +	/* Reported when the user wants to toggle the microphone mute status */
> +	{ KE_KEY,	UNIWILL_OSD_MIC_MUTE,			{ KEY_MICMUTE }},
> +
> +	/* Reported when the user locks/unlocks the Fn key */
> +	{ KE_IGNORE,	UNIWILL_OSD_FN_LOCK,			{ KEY_FN_ESC }},
> +
> +	/* Reported when the user wants to toggle the brightness of the keyboard */


Thanks,
Alok

