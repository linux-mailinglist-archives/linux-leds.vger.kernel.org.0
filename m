Return-Path: <linux-leds+bounces-5048-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E42B02ACD
	for <lists+linux-leds@lfdr.de>; Sat, 12 Jul 2025 14:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04D9D7B46BB
	for <lists+linux-leds@lfdr.de>; Sat, 12 Jul 2025 12:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4D782253FE;
	Sat, 12 Jul 2025 12:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jC17dlOy";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SbnLv20J"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB86B665;
	Sat, 12 Jul 2025 12:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752323555; cv=fail; b=CqSpTXNRgwBLHFoFbVM5DZ1JGJtihjdo9w9y51kBpjjQpKOeHTlH2oO2AQRCGTnSx/XfmI7nM7ZTpT56iLIp+J3+eXJXIK1bXm+qkChbDUng4VMf11nZThuz8bQ5Q0wZ2IzQgJzrrmCJz6VdkU5vrhtIXFfBDOBbx+edD2R5kRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752323555; c=relaxed/simple;
	bh=fjXkbUHvk9zC3zMzALfKZE/1tSV/r9k6b9hFlFoBPAw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QkRRqz+Knga+sfYQDyl5TJdEVAc0Ja7LeGiSSk9eKSz2fdW+wWeNdEmvdSfWIgQmrWZ5oSZeyNKUqAFAj3D5afUWUYZxFooboVrb1xHwbDNLqw2CVWBiiXHT/zxjKilzVl1oSXEZd82dpkr8ivfBAx3V4qsefMTNGZcoOH/uvR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jC17dlOy; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SbnLv20J; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56CCF6IL029729;
	Sat, 12 Jul 2025 12:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=yNKeK1Z2cubW0FFHctpxfjZymthZKvdEzF5JKEpXlEY=; b=
	jC17dlOyBU2RgSX/pOOynDGOnvoWZUMOAWH2nXcXjh+0pohWrZzWgeurl/Whv2Ce
	9xLWFw26RjMd3kp0EC0AT7eahDgSryPYVxqDHuJtBKWIkwf6Qyn4YTw61zVt26mg
	5N/4RlQPlHr//t6fMmxLlymoYJt4yyCAX23fm1CGwcV8vkKrsS1lxRjoHL+WyHX8
	z1FploKcah311XnToZUd8yytoOrWp54ukleRbf0V2oE9XAUq1MfYl6H120xjB1xx
	B3aVhqs3xsXxMQylF63o2rkrNhjg9JGSdxhJq3zKEzxbzB32HmsBqnpwxmejr+bd
	LGYViDPcJDvwyu11S1ksIw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uk8frwpr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Jul 2025 12:31:58 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56C9dv57029654;
	Sat, 12 Jul 2025 12:31:58 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2049.outbound.protection.outlook.com [40.107.237.49])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ue56u091-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Jul 2025 12:31:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OyLK5OKsLpxXoHlgJCaTh3DfwMEfNFn+ceRsvCQX6cVAsp+1hFHWnHPAvQe6p2vaEYQt706tlxbDwnakoAUSBr7Tj4mKdcLkGOf7AsakGIePACGi6IINUf3t+BOsyhN7x9/fIjprnXiV4y/QAvBSw9XwVglVfsKuQtG8d9z1dsirILopnN9P4ProZ8gTBBOf4AZBiWS+9A4Oqy6F42iRLA8k8ouYUhDgpHYjyXDDdXM4qCFnpZFGHmIy2Bs5HnBVJ/9m6Gjlh43M9+ISOJGwpMahKFa2soRLkfyDwa3hDuR2zLXR3Vvp04Pg0R4ncjHcrRXKUty64PIfNNN3ffTloQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNKeK1Z2cubW0FFHctpxfjZymthZKvdEzF5JKEpXlEY=;
 b=vyQagXe1h/0dZTpn9gVNQqSh6DYseWRymAGqdS8nofoH4tAzlsJd+A5SRfWJAbJYNS0yHz6PvfkT5qM5sgxTf0vZJ+SmPPn/njsjpxQgFlXPMuc1GjIGzhPT+SdrOdSq0fbta2BAIvsJGJzF9aNMNXANDPIgP7VNWdH1X8Qwyr7tbjk7I+3wcDdIpIhaUNqAhflTRy0CotlSIkcUHiJnduru1I3pB8o0S01Ah53d3nxsnniuUqpjwiXYMaP+iXEh2Nb28p6InFxpP2hIZD+KHrwGYcX6X3MwFLWZvgVwN/SU7GddHIWtg10P0vh6sYDS1q5pqh4+Bmx02S7hgrhx4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNKeK1Z2cubW0FFHctpxfjZymthZKvdEzF5JKEpXlEY=;
 b=SbnLv20JxLBR7p0Aoi0Zm57eDxltt6oaiG9Kp8H5iWVTWyuonpgcGsMJN38nC36IxCrHOZMOaHU01n3RQQlbhAFFZzVUmtexZcz/ui3KIwn1cGjGmFY+gbg0/OmmmjZ1cp7bAO/p//GRN8bFg8vPdzb5EIRh0+C9FQkFTWPZfIU=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by LV3PR10MB7937.namprd10.prod.outlook.com (2603:10b6:408:21c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.30; Sat, 12 Jul
 2025 12:31:54 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%5]) with mapi id 15.20.8901.028; Sat, 12 Jul 2025
 12:31:54 +0000
Message-ID: <db62b066-07a1-4f40-b008-726c39321f4a@oracle.com>
Date: Sat, 12 Jul 2025 18:01:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [External] : [PATCH 2/3] platform/x86: Add Uniwill laptop driver
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com,
        hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net, cs@tuxedo.de,
        wse@tuxedocomputers.com, ggo@tuxedocomputers.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, rdunlap@infradead.org,
        linux-leds@vger.kernel.org, lee@kernel.org, pobrn@protonmail.com
References: <20250712112310.19964-1-W_Armin@gmx.de>
 <20250712112310.19964-3-W_Armin@gmx.de>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250712112310.19964-3-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0147.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::12) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|LV3PR10MB7937:EE_
X-MS-Office365-Filtering-Correlation-Id: 758f7c96-17bc-4dca-939a-08ddc140154f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TlU3bTdSVWE2RS9KZDhNWHFSRU9lWmwxNlZHODhkb08zMmxRcHBJYytneWky?=
 =?utf-8?B?b1lkamdaUnU4cFBoSmxUS2kzZld1Q3hCb0FEOWRLYnQzV3RzbHRYZVpvNisy?=
 =?utf-8?B?MDEwWWpPaE5NYXMydG5kQTI1Ly9OOFJzVFJBS2NRNk12alREN1d2WEE1YVdZ?=
 =?utf-8?B?WXVTc1AzUkMvMWppQzhtR1FZckhNalYyRGpEZ09qV1Q3MGU4eThLU2ZFaFJ4?=
 =?utf-8?B?VWMvbDJzSjhybEZQcEZFNEVDeUNPdDdYQ1FHd05odjlWMEtIbVYya0VtbjdK?=
 =?utf-8?B?bFAxaS9FTTdYTDBIRm1HNHJBMytuQmZZa25ObE5nWXhSdTZqNWJ4aXRIeUJY?=
 =?utf-8?B?YW1HeWtGVVZNbnZESGpBUnJLbmJuWENzNG1JcCtncUNIWExtY3VnYng1c1Z4?=
 =?utf-8?B?SVIvakZhWmRBYjJvNllqaHMxK3JDMG1zVVFrZlRtRXU1Y1V6b3ZQaDNPaFhy?=
 =?utf-8?B?MWUyZU1QUFFyaS91cWhyQWsyTkswTzdSOWFtU3Iwa1lCUC9BYUY5ZWRQR1VV?=
 =?utf-8?B?SWtTOVVQNnVobFdpRnZKN0JPTkg5b2lXL1Z6WnRqWDhsaWgwVGVRSjR2RVhq?=
 =?utf-8?B?T09adFMvVUZ0aFUzRlBFQmk3dzNZSWU5M2pXQUdNNDR4SkloUUZ4bXpWaDRF?=
 =?utf-8?B?WWZuY3cwak5DRnRLVVRQTzNIdXRCVTg1M3ZUeGdsdDZMaE02UGVFWndPUUZX?=
 =?utf-8?B?SkZXdFlSMVIySjNVWWdsWnBkdFdkbmdqQ3NGajlnd3lISk5iWHh5VHdMWWNH?=
 =?utf-8?B?MWhMNlZNTFJ3ZlZ3UFV5b1NRL1lQRjJUZ2s2b0NNSExvSVhMNm43bEcvV1F0?=
 =?utf-8?B?dnVyQUMzL0JwbFNOMXlxUldQTVlEbnE0ZnNFaVpsaXVHSUEyc29PK3ZtZXQw?=
 =?utf-8?B?ZjJnOTZyTElocmFRNEErSGZaZ0czSFN6SzNHMER1dnM2VTdPTXFQVVJuK0F5?=
 =?utf-8?B?bTgxVS9jQXFiTGxPS01KOFVIejRoSk5LYXJrSDZRUkxNZ3UwMTRFRXgzU0lP?=
 =?utf-8?B?M2VNM3ozbGtrVVYydk9YMWRheVJNekppd3BaRld3YTBUZFdMTmowMGtac3dz?=
 =?utf-8?B?K1AwV1FubEhOOFppaDNHZGRHOGRSMURzTDZQM3VMQXoybGVqWFpnRStoSFBN?=
 =?utf-8?B?clNJMVRkZ0UwY2dzRXRUNEZLK2dld0dBcUxvdGFJK0lDVTZyc2Z2eFE5RkZq?=
 =?utf-8?B?UzBKMExTMmhUU0RhaXltSlM4R1pGdkJDeDFBK0IzMWhCZ1djOE5JSDhZTHpH?=
 =?utf-8?B?MTFUN0YwWHptNXdqRkxnejJ3QzE2Q2NxSGFQVHdFQVRJRDQ0bldnT0NzZWNF?=
 =?utf-8?B?UHhPK05zZmorUHh4WHZaa3d4YzFJVjFodmZqOGVudEtqclBRZFdQdEcxaFcy?=
 =?utf-8?B?WXgzdkpiTThnWEc4eXJ6VENYV1lxR05lM0F3Q2Y2cnFDbzlSb0UrbysvcFd5?=
 =?utf-8?B?TGI0elErZ3loQm52VzBwVlNMNFFGTTFqR0lJdHlyZTBPb2hEYitGSy96MUxo?=
 =?utf-8?B?N2t4clA0eHNIdVdjUk9aQ1pMWTBlbWRSWUhVVFRmMk1mS1lDQ2pJSVBHajZ4?=
 =?utf-8?B?dlFsZi9DMlQ1d1lQVWRoMW9ielM1RHQycU9hNU16aWRpREMrcE1SbFhkV3JS?=
 =?utf-8?B?ZGg0eDNHZ2RoOXcyVVRSRWRSY2toRnc3MGd2WjE2NFZ3aUhHSTVIQWMzY0Vs?=
 =?utf-8?B?NkU3VXpJa0ZqTWpWbitUMktETGxXK24xMTR5MTdubTZ6cFNZdVI2Y0UvN2hR?=
 =?utf-8?B?UmhXeTBUaVFGVXI3S3NTUWh0R0dpNkJpVHNYTjIvWnRBMnpITUZKcnFwQURY?=
 =?utf-8?B?a3U4emN0Zk1sVzdoTk9NczNjZW9FY1J3UXpwdWhiTnd3aWpVTDFUODRrVHZP?=
 =?utf-8?Q?CisYS6C6YL2/w?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkhYOHpMMHN1M3BsSHpwUTRWQUVKZ0NUOXlqbkMzWERWRjEvWWlQQXVOQ0NF?=
 =?utf-8?B?Qm1ka3VnQWpFc1orbVdhalBiMXRmdXk2RFV3a3lQTG0yQUd6RW8waUl0Kzl6?=
 =?utf-8?B?SVAyVlY2bmJMM1hSV0FmWTdWd3ZGNDdwbkMxVmxnUGNTK0FKVXpkQ1dVL21I?=
 =?utf-8?B?MkM4QnZ2K2FyM0g1ZzRyYk05eXlTbHpLZ0JMVFQ5Q283TEV2NENrYnBJbUhs?=
 =?utf-8?B?Y2JYNHYveEVsdWp5ZHduQ3RBcHhIclRUZnlablFvbmMvMzY4cEZKcVMyZms1?=
 =?utf-8?B?cEgyektLa1lwbWU1aEFUUVhtbDlSUkNNa2tSSDlkOTNwQVowcDNGczFZZkti?=
 =?utf-8?B?L1laZTJpRWZDOUxDbHdnbmVzb0VPbi9iQXQ0OG0yUkREcXBqS3dYUjhpM3o5?=
 =?utf-8?B?Sytvck40ai9rOTRuZnBSYnZuMEovL1h1cFhSbFdNVVdKbHFNTG5La3RFNE5x?=
 =?utf-8?B?TzhqOWpteFVFUVRHSGV5TXlKR1RsZ2VxdUxvQm91SDlpUWw4NFZDVS82WXdP?=
 =?utf-8?B?UE1YSVltdXNCN0ZpZnZxeFRPTnNJSzNkd1d5RGpJK0k5V05MV3VuVitwS3E0?=
 =?utf-8?B?NEFLTnFBUUI0MWU4d2FmMFhkTGRtWW5ROUV3SXhoQ1Bla25SWDl6RVQvcS91?=
 =?utf-8?B?eEVmOEt3aVRrWnNlOGNJWlZSaFdRRUcxSmNrSTFuY1N5Tjk4b3hKT2pkalBS?=
 =?utf-8?B?RFFKZlJBVFdMU1AxS1VZRlNJRHkzUHNVTTF2b1dIOStIRU52aVRDZ2E2ZXlD?=
 =?utf-8?B?ZFliZUVmTWFXUHN4eit5YTBweVd3RjdUZWJ0NEo5U2NGUUpvWWIrUGFDUjdJ?=
 =?utf-8?B?K2hKZjFNTTJ5dnhuOGhwMCtjNzk3WGM5NDNtVkRpaFJhR0JQY0xHY2xkU3RE?=
 =?utf-8?B?S0oyNnlGQnNnS21rczhiZkRKR3RmTkFxOGU5UUk4eVgxeWhIanZ6RkhJYUpk?=
 =?utf-8?B?c1didFZFaTQwSytsVUdWRWZvQTY1MFU4QkdwUXJFRkV3K0psRytaUlIxb0h3?=
 =?utf-8?B?N0dnNWpSYTdtcXhuR29EaVJqa2tuWGQrbnNIaEpkUlh3QzB5WWNVWDVLRktU?=
 =?utf-8?B?SE0weE1Jb0M2WTVuOHJQUm9qelduTXdXY1c4WmNERkJXeHdyTGNKZnUzcXFR?=
 =?utf-8?B?Q3ROS0dlQWZlRmxFWFNRNENsS2hZeVBUdVE2RHY2V3NDejNCOFE3MlppQjlC?=
 =?utf-8?B?MUlQQjVrZGhQNXZ6TDd1enBJSnN1VDhqVDJ0bU01UTBRSldXaGZOQkp6a2ZP?=
 =?utf-8?B?N0l4MFBiZG92bWRqTkR0QW1hOEdHcUdNYWFYaHZVVkovM3Q4ODlxUkV3V1Uw?=
 =?utf-8?B?WmQ1em14UnIyajd6aXB5QmlwanJ3b0pOQ1lxVGdJanRhUXp3QXhLSHpWdE1n?=
 =?utf-8?B?ei9zS2V0emtvOUUxblRsZzV3ajdGUG9kUVpveE15L1RzSkI2QzlQOGk4RG9x?=
 =?utf-8?B?bDhkYllNZFB1ZHJnM1RQQTNYSnlsWkt3SGwyZytuNmJtKzdBWDkrNE1HNnl2?=
 =?utf-8?B?K1VTODhITDBSbEVmOTJSS1I1cDhJUzRqT0oySXN6S0VVQXpkNC9QdGVrekQ2?=
 =?utf-8?B?SWdENXdTWVlzZ3BXc1MxbTVoMEp5UlVPc1ZERnpVOUtXcWhjNFZyWi81OUla?=
 =?utf-8?B?NlBrcjdtK3d3dzUzUU44dVM4RW9FcjE3bWIwZWgzc2ljOTA1Ny9NU0c3Z0NW?=
 =?utf-8?B?OWFTQi9PWTR6UFhaMnJhQ05QYmRTNXg4MWRsSnUvTG9iYXpiOGNOK1QvcE1G?=
 =?utf-8?B?Z2cxWnltU0I5Y2dSWWtUWjNGTWpDTEJKZzJ5UzRrT0NJeWZCK0dyUjBRdVJK?=
 =?utf-8?B?ZklOT3NWOEpOWmgwZW9KNlcyemYvaWhXK3dwWHhsbVhJVTdMMGY4eTMzZlJI?=
 =?utf-8?B?NjhydGhXYzdKSkdabTNSQmdncWZORDR0dStaYUtyQzFuUS93TFZVR2FaTEor?=
 =?utf-8?B?WFhuWW80TlI2OW1QN294enhQWGVGdW44YzErckJoZ3QwN2ZoZjFaeW9nMmRz?=
 =?utf-8?B?UGZkVmpPR0h2eXh6QytSU1cvVS9oZDhqL2NEamgwc0Z6Q2gxbmZyMUdjVWQy?=
 =?utf-8?B?ZWVtNERzQkhUMno4S2I1dzEzTVBwMnJ0S29ESEpkeEJ5NEw4aEdMbGsrSEZD?=
 =?utf-8?B?QmQrOFBKM0RYWmhzVm81ZHNYY1ZIUjJVeU01bGluM3NRSDRtM2FKd2VyU204?=
 =?utf-8?B?RHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CVHIn5iFyPhOe2BYv8GQuq/elPTHki2/gxSQRV3GBdvKvCEU//Vk5KuBhUvNCZ6vIHW8gfjuveu9BIKjNM0X+y3ZG5tzcZ5XSPfMyBvPFfYDR3kc+2/SWCfkyOPp5S46m//XJ58anbE3gXG/euLwmhQS/3vXCvW+6hd8RsLBvMqnCZFh5YU0ofI7+Jinq8cw47gymTS93/orDW46MNoYoupfI/I2+zjxza5tYXFGpJPGOsp91PTHUkLdOxQePietHsKxpXCzBRuF1nxatFtwPUfYJWTVa6EODczbmQAqf9kL0NxtPgDRXFh5gT2r22Y8LB3yRC+0EFArDx3F9ji0vFs9tjRdzNTtYDNe9agCulWJX7f32EEWEL/7iRMRjIqCNbB3MJhUaSTyMCFGNhwD5+S+tF8fVEB/cRje1z1IewF7ZhIQ/oiPjGYBP2dGsjnkC9+Q2symKyONZgKrDrta9mWOvmtwoRbnaHxfAxJWt+t7K8zYqu6ckND1AqucSY0Vq1alc5V1s8Bux+IOAA+qCZuRzW2vpM29T885oovmBkdqz5YCBNT47NWAEuxKerqFVuBw18FcL21uY5qVQLJAUbk4A3LhuH0C+9mxFhOaX34=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 758f7c96-17bc-4dca-939a-08ddc140154f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2025 12:31:54.2277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4EdbapM63zBpfStmvBQ/zATDFSEhdR/PpnEXN23/2FjAisXFwrvWlrzPf49PXq2E0DZ6XM+A9B2iHD4AXzVViUznGtmMDVAGPZAfBSi2EYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7937
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-12_02,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 spamscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507120097
X-Proofpoint-ORIG-GUID: zkU9z7bdeTe_7gBdQ3Zx27pTdfEiGHQJ
X-Authority-Analysis: v=2.4 cv=Of+YDgTY c=1 sm=1 tr=0 ts=687255be cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=NEAV23lmAAAA:8 a=p0WdMEafAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=7zjo2o93_mra7aan5WEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: zkU9z7bdeTe_7gBdQ3Zx27pTdfEiGHQJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDA5NyBTYWx0ZWRfXxVfsS7Xky5zx 7BbZafEW9+MeDijZchmcK1iF9Gz3q4KxTLmJLWgp7Z/EhNw3cn55gr2KtdWVFSnRzGl0Qvyyu8u 45fOnMwUyualtzMHJFw4cvUXQ23RVTU7fF7S0eQsWhALWgIq/zT2ZAyRy72d/eriso+xglMGMBe
 GxiqlMUwkRnctbXYPy5KAlMgjLicMQO+vVs1ILysrgC4dqZvWunQRv5Zwuv7wyO1pnLPL5GaQ8T 74XfpLI7VIcUzn7ZLSbfigqZsqCzLkVM2wXHhhdiVFzu4i+kfPubgRmcXekCE3fMUL/jUbmgb1m PiiiYuKb7Iqq+nbF73WPNgrwe1kqAThPYm6HipA0V1kAHffJtf9ab4eRTBLkJKlfB0dkHGOO++9
 mYQU31Ivd/FlO9kcKQu0QRuPYMVm7V8eh8l/wNTLyN2VFIDi6e7EeLQm2cxfToTUVa6Qy1Ec



On 7/12/2025 4:53 PM, Armin Wolf wrote:
> Add a new driver for Uniwill laptops. The driver uses a ACPI WMI
> interface to talk with the embedded controller, but relies on a
> DMI whitelist for autoloading since Uniwill just copied the WMI
> GUID from the Windows driver example.
> 
> The driver is reverse-engineered based on the following information:
> - OEM software from intel
> - https://urldefense.com/v3/__https://github.com/pobrn/qc71_laptop__;!!ACWV5N9M2RV99hQ!PYW0bhvxAIvo5Q628_nWz3JpVFEvKWLr7b7gsh_jVvTEAgryiLemldZWYQTMNVOlQHLFfZWCJ4XSA0Zht1c$
> - https://urldefense.com/v3/__https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers__;!!ACWV5N9M2RV99hQ!PYW0bhvxAIvo5Q628_nWz3JpVFEvKWLr7b7gsh_jVvTEAgryiLemldZWYQTMNVOlQHLFfZWCJ4XSlSKbZG4$
> - https://urldefense.com/v3/__https://github.com/tuxedocomputers/tuxedo-control-center__;!!ACWV5N9M2RV99hQ!PYW0bhvxAIvo5Q628_nWz3JpVFEvKWLr7b7gsh_jVvTEAgryiLemldZWYQTMNVOlQHLFfZWCJ4XSGW2eamI$
> 
> The underlying EC supports various features, including hwmon sensors,
> battery charge limiting, a RGB lightbar and keyboard-related controls.
> 
> Reported-by: cyear <chumuzero@gmail.com>
> Closes: https://urldefense.com/v3/__https://github.com/lm-sensors/lm-sensors/issues/508__;!!ACWV5N9M2RV99hQ!PYW0bhvxAIvo5Q628_nWz3JpVFEvKWLr7b7gsh_jVvTEAgryiLemldZWYQTMNVOlQHLFfZWCJ4XSUXC3pPE$
> Closes: https://urldefense.com/v3/__https://github.com/Wer-Wolf/uniwill-laptop/issues/3__;!!ACWV5N9M2RV99hQ!PYW0bhvxAIvo5Q628_nWz3JpVFEvKWLr7b7gsh_jVvTEAgryiLemldZWYQTMNVOlQHLFfZWCJ4XS1sL_cIM$
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>   .../ABI/testing/sysfs-driver-uniwill-laptop   |   53 +
>   Documentation/wmi/devices/uniwill-laptop.rst  |  118 ++
>   MAINTAINERS                                   |    8 +
>   drivers/platform/x86/uniwill/Kconfig          |   17 +
>   drivers/platform/x86/uniwill/Makefile         |    1 +
>   drivers/platform/x86/uniwill/uniwill-laptop.c | 1481 +++++++++++++++++
>   drivers/platform/x86/uniwill/uniwill-wmi.c    |    3 +-
>   7 files changed, 1680 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/ABI/testing/sysfs-driver-uniwill-laptop
>   create mode 100644 Documentation/wmi/devices/uniwill-laptop.rst
>   create mode 100644 drivers/platform/x86/uniwill/uniwill-laptop.c
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
> new file mode 100644
> index 000000000000..7a540a7b9f24
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
> @@ -0,0 +1,53 @@
> +What:		/sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/fn_lock
> +Date:		June 2025
> +KernelVersion:	6.17
> +Contact:	Armin Wolf <W_Armin@gmx.de>
> +Description:
> +		Allows userspace applications to enable/disable the FN lock feature
> +		of the integrated keyboard by writing "enable"/"disable" into this file.
> +
> +		Reading this file returns the current enable status of the FN lock functionality.
> +
> +What:		/sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/super_key_lock
> +Date:		June 2025
> +KernelVersion:	6.17
> +Contact:	Armin Wolf <W_Armin@gmx.de>
> +Description:
> +                Allows userspace applications to enable/disable the super key functionality
> +                of the integrated keyboard by writing "enable"/"disable" into this file.
> +
> +		Reading this file returns the current enable status of the super key functionality.
> +
> +What:		/sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/touchpad_toggle
> +Date:		June 2025
> +KernelVersion:	6.17
> +Contact:	Armin Wolf <W_Armin@gmx.de>
> +Description:
> +		Allows userspace applications to enable/disable the touchpad toggle functionality
> +		of the integrated touchpad by writing "enable"/"disable" into this file.
> +
> +		Reading this file returns the current enable status of the touchpad toggle
> +		functionality.
> +
> +What:		/sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/rainbow_animation
> +Date:		June 2025
> +KernelVersion:	6.17
> +Contact:	Armin Wolf <W_Armin@gmx.de>
> +Description:
> +		Forces the integrated lightbar to display a rainbow animation when the machine
> +		is not suspended. Writing "enable"/"disable" into this file enables/disables
> +		this functionality.
> +
> +		Reading this file returns the current status of the rainbow animation functionality.
> +
> +What:		/sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/breathing_in_suspend
> +Date:		June 2025
> +KernelVersion:	6.17
> +Contact:	Armin Wolf <W_Armin@gmx.de>
> +Description:
> +		Causes the integrated lightbar to display a breathing animation when the machine
> +		has been suspended and is running on AC power. Writing "enable"/"disable" into
> +		this file enables/disables this functionality.
> +
> +		Reading this file returns the current status of the breathing animation
> +		functionality.
> diff --git a/Documentation/wmi/devices/uniwill-laptop.rst b/Documentation/wmi/devices/uniwill-laptop.rst
> new file mode 100644
> index 000000000000..77a544b91f9e
> --- /dev/null
> +++ b/Documentation/wmi/devices/uniwill-laptop.rst
> @@ -0,0 +1,118 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +============================================
> +Uniwill WMI Notebook driver (uniwill-laptop)
> +============================================
> +
> +Introduction
> +============
> +
> +Many notebooks manufactured by Uniwill (either directly or as ODM) provide a WMI-based
> +EC interface for controlling various platform settings like sensors and fan control.
> +This interface is used by the ``uniwill-laptop`` driver to map those features onto standard
> +kernel interfaces.
> +
> +WMI interface description
> +=========================
> +
> +The WMI interface description can be decoded from the embedded binary MOF (bmof)
> +data using the `bmfdec <https://urldefense.com/v3/__https://github.com/pali/bmfdec__;!!ACWV5N9M2RV99hQ!PYW0bhvxAIvo5Q628_nWz3JpVFEvKWLr7b7gsh_jVvTEAgryiLemldZWYQTMNVOlQHLFfZWCJ4XS_REL1dI$ >`_ utility:
> +
> +::
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),
> +   Description("Class used to operate methods on a ULong"),
> +   guid("{ABBC0F6F-8EA1-11d1-00A0-C90629100000}")]
> +  class AcpiTest_MULong {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +
> +    [WmiMethodId(1), Implemented, read, write, Description("Return the contents of a ULong")]
> +    void GetULong([out, Description("Ulong Data")] uint32 Data);
> +
> +    [WmiMethodId(2), Implemented, read, write, Description("Set the contents of a ULong")]
> +    void SetULong([in, Description("Ulong Data")] uint32 Data);
> +
> +    [WmiMethodId(3), Implemented, read, write,
> +     Description("Generate an event containing ULong data")]
> +    void FireULong([in, Description("WMI requires a parameter")] uint32 Hack);
> +
> +    [WmiMethodId(4), Implemented, read, write, Description("Get and Set the contents of a ULong")]
> +    void GetSetULong([in, Description("Ulong Data")] uint64 Data,
> +                     [out, Description("Ulong Data")] uint32 Return);
> +
> +    [WmiMethodId(5), Implemented, read, write,
> +     Description("Get and Set the contents of a ULong for Dollby button")]
> +    void GetButton([in, Description("Ulong Data")] uint64 Data,
> +                   [out, Description("Ulong Data")] uint32 Return);
> +  };
> +
> +Most of the WMI-related code was copied from the Windows driver samples, which unfortunately means
> +that the WMI-GUID is not unique. This makes the WMI-GUID unusable for autoloading.
> +
> +WMI method GetULong()
> +---------------------
> +
> +This WMI method was copied from the Windows driver samples and has no function.
> +
> +WMI method SetULong()
> +---------------------
> +
> +This WMI method was copied from the Windows driver samples and has no function.
> +
> +WMI method FireULong()
> +----------------------
> +
> +This WMI method allows to inject a WMI event with a 32-bit payload. Its primary purpose seems
> +to be debugging.
> +
> +WMI method GetSetULong()
> +------------------------
> +
> +This WMI method is used to communicate with the EC. The ``Data`` argument hold the following
> +information (starting with the least significant byte):
> +
> +1. 16-bit address
> +2. 16-bit data (set to ``0x0000`` when reading)
> +3. 16-bit operation (``0x0100`` for reading and ``0x0000`` for writing)
> +4. 16-bit reserved (set to ``0x0000``)
> +
> +The first 8 bits of the ``Return`` value contain the data returned by the EC when reading.
> +The special value ``0xFEFEFEFE`` is used to indicate a communication failure with the EC.
> +
> +WMI method GetButton()
> +----------------------
> +
> +This WMI method is not implemented on all machines and has an unknown purpose.
> +
> +Relation with the ``INOU0000`` ACPI device
> +==========================================
> +
> +It seems that many of the embedded controller registers can also be accessed by using the ``ECRR``
> +and ``ECRW`` ACPI control methods under the ``INOU0000`` ACPI device. This sidesteps the overhead
> +of the WMI interface but does not work for the registers in the range between ``0x1800`` and
> +``0x18FF``. More research is needed to determine whether this interface imposes addtional

typo addtional

> +restrictions.
> +
> +Reverse-Engineering the Uniwill WMI interface
> +=============================================
> +
> +.. warning:: Randomly poking the EC can potentially cause damage to the machine and other unwanted
> +             side effects, please be careful.
> +
> +The EC behind the ``GetSetULong`` method is used by the OEM software supplied by the manufacturer.
> +Reverse-engineering of this software is difficult since it uses an obfuscator, however some parts
> +are not obfuscated. In this case `dnSpy <https://urldefense.com/v3/__https://github.com/dnSpy/dnSpy__;!!ACWV5N9M2RV99hQ!PYW0bhvxAIvo5Q628_nWz3JpVFEvKWLr7b7gsh_jVvTEAgryiLemldZWYQTMNVOlQHLFfZWCJ4XSRgqJyGQ$ >`_ could also be helpful.
> +
> +The EC can be accessed under Windows using powershell (requires admin privileges):
> +
> +::
> +
> +  > $obj = Get-CimInstance -Namespace root/wmi -ClassName AcpiTest_MULong | Select-Object -First 1
> +  > Invoke-CimMethod -InputObject $obj -MethodName GetSetULong -Arguments @{Data = <input>}
> +
> +Special thanks go to github user `pobrn` which developed the
> +`qc71_laptop <https://urldefense.com/v3/__https://github.com/pobrn/qc71_laptop__;!!ACWV5N9M2RV99hQ!PYW0bhvxAIvo5Q628_nWz3JpVFEvKWLr7b7gsh_jVvTEAgryiLemldZWYQTMNVOlQHLFfZWCJ4XSA0Zht1c$ >`_ driver on which this driver is partly based.
> +The same is true for Tuxedo Computers, which developed the
> +`tuxedo-drivers <https://urldefense.com/v3/__https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers__;!!ACWV5N9M2RV99hQ!PYW0bhvxAIvo5Q628_nWz3JpVFEvKWLr7b7gsh_jVvTEAgryiLemldZWYQTMNVOlQHLFfZWCJ4XSlSKbZG4$ >`_ package
> +which also served as a foundation for this driver.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6c5879bd2ba2..3efec7a99262 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25490,6 +25490,14 @@ L:	linux-scsi@vger.kernel.org
>   S:	Maintained
>   F:	drivers/ufs/host/ufs-renesas.c
>   
> +UNIWILL LAPTOP DRIVER
> +M:	Armin Wolf <W_Armin@gmx.de>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/ABI/testing/sysfs-driver-uniwill-laptop
> +F:	Documentation/wmi/devices/uniwill-laptop.rst
> +F:	drivers/platform/x86/uniwill/uniwill-laptop.c
> +
>   UNIWILL WMI DRIVER
>   M:	Armin Wolf <W_Armin@gmx.de>
>   L:	platform-driver-x86@vger.kernel.org
> diff --git a/drivers/platform/x86/uniwill/Kconfig b/drivers/platform/x86/uniwill/Kconfig
> index 7571b30edb11..46d9af52b3f2 100644
> --- a/drivers/platform/x86/uniwill/Kconfig
> +++ b/drivers/platform/x86/uniwill/Kconfig
> @@ -16,6 +16,23 @@ menuconfig X86_PLATFORM_DRIVERS_UNIWILL
>   
>   if X86_PLATFORM_DRIVERS_UNIWILL
>   
> +config UNIWILL_LAPTOP
> +	tristate "Uniwill Laptop Extras"
> +	default m
> +	depends on ACPI_WMI
> +	depends on ACPI_BATTERY
> +	depends on UNIWILL_WMI
> +	depends on HWMON
> +	depends on LEDS_CLASS_MULTICOLOR
> +	depends on DMI
> +	select REGMAP
> +	help
> +	  This driver adds support for various extra features found on Uniwill laptops,
> +	  like the lightbar and hwmon sensors. It also supports many OEM laptops
> +	  originally manufactured by Uniwill.
> +
> +	  If you have such a laptop, say Y or M here.
> +
>   config UNIWILL_WMI
>   	tristate "Uniwill WMI Event Driver"
>   	default m
> diff --git a/drivers/platform/x86/uniwill/Makefile b/drivers/platform/x86/uniwill/Makefile
> index a5a300be63f3..b55169a49e1e 100644
> --- a/drivers/platform/x86/uniwill/Makefile
> +++ b/drivers/platform/x86/uniwill/Makefile
> @@ -4,4 +4,5 @@
>   # Uniwill X86 Platform Specific Drivers
>   #
>   
> +obj-$(CONFIG_UNIWILL_LAPTOP)	+= uniwill-laptop.o
>   obj-$(CONFIG_UNIWILL_WMI)	+= uniwill-wmi.o
> diff --git a/drivers/platform/x86/uniwill/uniwill-laptop.c b/drivers/platform/x86/uniwill/uniwill-laptop.c
> new file mode 100644
> index 000000000000..141c58673525
> --- /dev/null
> +++ b/drivers/platform/x86/uniwill/uniwill-laptop.c
> @@ -0,0 +1,1481 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Linux driver for Uniwill notebooks.
> + *
> + * Special thanks go to Pőcze Barnabás, Christoffer Sandberg and Werner Sembach
> + * for supporting the development of this driver either through prior work or
> + * by answering questions regarding the underlying WMI interface.
> + *
> + * Copyright (C) 2025 Armin Wolf <W_Armin@gmx.de>
> + */
> +
> +#define pr_format(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/acpi.h>
> +#include <linux/bits.h>
> +#include <linux/bitfield.h>
> +#include <linux/cleanup.h>
> +#include <linux/debugfs.h>
> +#include <linux/device.h>
> +#include <linux/device/driver.h>
> +#include <linux/dmi.h>
> +#include <linux/errno.h>
> +#include <linux/fixp-arith.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/kstrtox.h>
> +#include <linux/leds.h>
> +#include <linux/led-class-multicolor.h>
> +#include <linux/limits.h>
> +#include <linux/list.h>
> +#include <linux/minmax.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/notifier.h>
> +#include <linux/pm.h>
> +#include <linux/printk.h>
> +#include <linux/regmap.h>
> +#include <linux/string.h>
> +#include <linux/string_choices.h>
> +#include <linux/sysfs.h>
> +#include <linux/types.h>
> +#include <linux/unaligned.h>
> +#include <linux/units.h>
> +#include <linux/wmi.h>
> +
> +#include <acpi/battery.h>
> +
> +#include "uniwill-wmi.h"
> +
> +#define EC_ADDR_BAT_POWER_UNIT_1	0x0400
> +

Unnecessary Blank Lines for same logical blocks

> +#define EC_ADDR_BAT_POWER_UNIT_2	0x0401
> +
> +#define EC_ADDR_BAT_DESIGN_CAPACITY_1	0x0402
> +
> +#define EC_ADDR_BAT_DESIGN_CAPACITY_2	0x0403
> +
> +#define EC_ADDR_BAT_FULL_CAPACITY_1	0x0404
> +
> +#define EC_ADDR_BAT_FULL_CAPACITY_2	0x0405
> +
> +#define EC_ADDR_BAT_DESIGN_VOLTAGE_1	0x0408
> +
> +#define EC_ADDR_BAT_DESIGN_VOLTAGE_2	0x0409
> +
> +#define EC_ADDR_BAT_STATUS_1		0x0432
> +#define BAT_DISCHARGING			BIT(0)
> +
> +#define EC_ADDR_BAT_STATUS_2		0x0433
> +
> +#define EC_ADDR_BAT_CURRENT_1		0x0434
> +
> +#define EC_ADDR_BAT_CURRENT_2		0x0435
> +
> +#define EC_ADDR_BAT_REMAIN_CAPACITY_1	0x0436
> +
> +#define EC_ADDR_BAT_REMAIN_CAPACITY_2	0x0437
> +
> +#define EC_ADDR_BAT_VOLTAGE_1		0x0438
> +
> +#define EC_ADDR_BAT_VOLTAGE_2		0x0439
> +
> +#define EC_ADDR_CPU_TEMP		0x043E
> +
> +#define EC_ADDR_GPU_TEMP		0x044F
> +
> +#define EC_ADDR_MAIN_FAN_RPM_1		0x0464
> +
> +#define EC_ADDR_MAIN_FAN_RPM_2		0x0465
> +
> +#define EC_ADDR_SECOND_FAN_RPM_1	0x046C
> +
> +#define EC_ADDR_SECOND_FAN_RPM_2	0x046D
> +
> +#define EC_ADDR_DEVICE_STATUS		0x047B
> +#define WIFI_STATUS_ON			BIT(7)
> +/* BIT(5) is also unset depending on the rfkill state (bluetooth?) */
> +
> +#define EC_ADDR_BAT_ALERT		0x0494
> +
> +#define EC_ADDR_BAT_CYCLE_COUNT_1	0x04A6
> +
> +#define EC_ADDR_BAT_CYCLE_COUNT_2	0x04A7
> +
> +#define EC_ADDR_PROJECT_ID		0x0740
> +
> +#define EC_ADDR_AP_OEM			0x0741
> +#define	ENABLE_MANUAL_CTRL		BIT(0)
> +#define ITE_KBD_EFFECT_REACTIVE		BIT(3)
> +#define FAN_ABNORMAL			BIT(5)
> +
> +#define EC_ADDR_SUPPORT_5		0x0742
> +#define FAN_TURBO_SUPPORTED		BIT(4)
> +#define FAN_SUPPORT			BIT(5)
> +
> +#define EC_ADDR_CTGP_DB_CTRL		0x0743
> +#define CTGP_DB_GENERAL_ENABLE		BIT(0)
> +#define CTGP_DB_DB_ENABLE		BIT(1)
> +#define CTGP_DB_CTGP_ENABLE		BIT(2)
> +
> +#define EC_ADDR_CTGP_OFFSET		0x0744
> +
> +#define EC_ADDR_TPP_OFFSET		0x0745
> +
> +#define EC_ADDR_MAX_TGP			0x0746
> +
> +#define EC_ADDR_LIGHTBAR_AC_CTRL	0x0748
> +#define LIGHTBAR_APP_EXISTS		BIT(0)
> +#define LIGHTBAR_POWER_SAVE		BIT(1)
> +#define LIGHTBAR_S0_OFF			BIT(2)
> +#define LIGHTBAR_S3_OFF			BIT(3)	// Breathing animation when suspended
> +#define LIGHTBAR_WELCOME		BIT(7)	// Rainbow animation
> +
> +#define EC_ADDR_LIGHTBAR_AC_RED		0x0749
> +
> +#define EC_ADDR_LIGHTBAR_AC_GREEN	0x074A
> +
> +#define EC_ADDR_LIGHTBAR_AC_BLUE	0x074B
> +
> +#define EC_ADDR_BIOS_OEM		0x074E
> +#define FN_LOCK_STATUS			BIT(4)
> +
> +#define EC_ADDR_MANUAL_FAN_CTRL		0x0751
> +#define FAN_LEVEL_MASK			GENMASK(2, 0)
> +#define FAN_MODE_TURBO			BIT(4)
> +#define FAN_MODE_HIGH			BIT(5)
> +#define FAN_MODE_BOOST			BIT(6)
> +#define FAN_MODE_USER			BIT(7)
> +
> +#define EC_ADDR_PWM_1			0x075B
> +
> +#define EC_ADDR_PWM_2			0x075C
> +
> +/* Unreliable */
> +#define EC_ADDR_SUPPORT_1		0x0765
> +#define AIRPLANE_MODE			BIT(0)
> +#define GPS_SWITCH			BIT(1)
> +#define OVERCLOCK			BIT(2)
> +#define MACRO_KEY			BIT(3)
> +#define SHORTCUT_KEY			BIT(4)
> +#define SUPER_KEY_LOCK			BIT(5)
> +#define LIGHTBAR			BIT(6)
> +#define FAN_BOOST			BIT(7)
> +
> +#define EC_ADDR_SUPPORT_2		0x0766
> +#define SILENT_MODE			BIT(0)
> +#define USB_CHARGING			BIT(1)
> +#define RGB_KEYBOARD			BIT(2)
> +#define CHINA_MODE			BIT(5)
> +#define MY_BATTERY			BIT(6)
> +
> +#define EC_ADDR_TRIGGER			0x0767
> +#define TRIGGER_SUPER_KEY_LOCK		BIT(0)
> +#define TRIGGER_LIGHTBAR		BIT(1)
> +#define TRIGGER_FAN_BOOST		BIT(2)
> +#define TRIGGER_SILENT_MODE		BIT(3)
> +#define TRIGGER_USB_CHARGING		BIT(4)
> +#define RGB_APPLY_COLOR			BIT(5)
> +#define RGB_LOGO_EFFECT			BIT(6)
> +#define RGB_RAINBOW_EFFECT		BIT(7)
> +
> +#define EC_ADDR_SWITCH_STATUS		0x0768
> +#define SUPER_KEY_LOCK_STATUS		BIT(0)
> +#define LIGHTBAR_STATUS			BIT(1)
> +#define FAN_BOOST_STATUS		BIT(2)
> +#define MACRO_KEY_STATUS		BIT(3)
> +#define MY_BAT_POWER_BAT_STATUS		BIT(4)
> +
> +#define EC_ADDR_RGB_RED			0x0769
> +
> +#define EC_ADDR_RGB_GREEN		0x076A
> +
> +#define EC_ADDR_RGB_BLUE		0x076B
> +
> +#define EC_ADDR_ROMID_START		0x0770
> +#define ROMID_LENGTH			14
> +
> +#define EC_ADDR_ROMID_EXTRA_1		0x077E
> +
> +#define EC_ADDR_ROMID_EXTRA_2		0x077F
> +
> +#define EC_ADDR_BIOS_OEM_2		0x0782
> +#define FAN_V2_NEW			BIT(0)
> +#define FAN_QKEY			BIT(1)
> +#define FAN_TABLE_OFFICE_MODE		BIT(2)
> +#define FAN_V3				BIT(3)
> +#define DEFAULT_MODE			BIT(4)
> +
> +#define EC_ADDR_PL1_SETTING		0x0783
> +
> +#define EC_ADDR_PL2_SETTING		0x0784
> +
> +#define EC_ADDR_PL4_SETTING		0x0785
> +
> +#define EC_ADDR_FAN_DEFAULT		0x0786
> +#define FAN_CURVE_LENGTH		5
> +
> +#define EC_ADDR_KBD_STATUS		0x078C
> +#define KBD_WHITE_ONLY			BIT(0)	// ~single color
> +#define KBD_SINGLE_COLOR_OFF		BIT(1)
> +#define KBD_TURBO_LEVEL_MASK		GENMASK(3, 2)
> +#define KBD_APPLY			BIT(4)
> +#define KBD_BRIGHTNESS			GENMASK(7, 5)
> +
> +#define EC_ADDR_FAN_CTRL		0x078E
> +#define FAN3P5				BIT(1)
> +#define CHARGING_PROFILE		BIT(3)
> +#define UNIVERSAL_FAN_CTRL		BIT(6)
> +
> +#define EC_ADDR_BIOS_OEM_3		0x07A3
> +#define FAN_REDUCED_DURY_CYCLE		BIT(5)
> +#define FAN_ALWAYS_ON			BIT(6)
> +
> +#define EC_ADDR_BIOS_BYTE		0x07A4
> +#define FN_LOCK_SWITCH			BIT(3)
> +
> +#define EC_ADDR_OEM_3			0x07A5
> +#define POWER_LED_MASK			GENMASK(1, 0)
> +#define POWER_LED_LEFT			0x00
> +#define POWER_LED_BOTH			0x01
> +#define POWER_LED_NONE			0x02
> +#define FAN_QUIET			BIT(2)
> +#define OVERBOOST			BIT(4)
> +#define HIGH_POWER			BIT(7)
> +
> +#define EC_ADDR_OEM_4			0x07A6
> +#define OVERBOOST_DYN_TEMP_OFF		BIT(1)
> +#define TOUCHPAD_TOGGLE_OFF		BIT(6)
> +
> +#define EC_ADDR_CHARGE_CTRL		0x07B9
> +#define CHARGE_CTRL_MASK		GENMASK(6, 0)
> +#define CHARGE_CTRL_REACHED		BIT(7)
> +
> +#define EC_ADDR_UNIVERSAL_FAN_CTRL	0x07C5
> +#define SPLIT_TABLES			BIT(7)
> +
> +#define EC_ADDR_AP_OEM_6		0x07C6
> +#define ENABLE_UNIVERSAL_FAN_CTRL	BIT(2)
> +#define BATTERY_CHARGE_FULL_OVER_24H	BIT(3)
> +#define BATTERY_ERM_STATUS_REACHED	BIT(4)
> +
> +#define EC_ADDR_CHARGE_PRIO		0x07CC
> +#define CHARGING_PERFORMANCE		BIT(7)
> +
> +/* Same bits as EC_ADDR_LIGHTBAR_AC_CTRL except LIGHTBAR_S3_OFF */
> +#define EC_ADDR_LIGHTBAR_BAT_CTRL	0x07E2
> +
> +#define EC_ADDR_LIGHTBAR_BAT_RED	0x07E3
> +
> +#define EC_ADDR_LIGHTBAR_BAT_GREEN	0x07E4
> +
> +#define EC_ADDR_LIGHTBAR_BAT_BLUE	0x07E5
> +
> +#define EC_ADDR_CPU_TEMP_END_TABLE	0x0F00
> +
> +#define EC_ADDR_CPU_TEMP_START_TABLE	0x0F10
> +
> +#define EC_ADDR_CPU_FAN_SPEED_TABLE	0x0F20
> +
> +#define EC_ADDR_GPU_TEMP_END_TABLE	0x0F30
> +
> +#define EC_ADDR_GPU_TEMP_START_TABLE	0x0F40
> +
> +#define EC_ADDR_GPU_FAN_SPEED_TABLE	0x0F50
> +
> +/*
> + * Those two registers technically allow for manual fan control,
> + * but are unstable on some models and are likely not meant to
> + * be used by applications.
> + */
> +#define EC_ADDR_PWM_1_WRITEABLE		0x1804
> +
> +#define EC_ADDR_PWM_2_WRITEABLE		0x1809
> +
> +#define DRIVER_NAME	"uniwill"
> +#define UNIWILL_GUID	"ABBC0F6F-8EA1-11D1-00A0-C90629100000"
> +
> +#define PWM_MAX			200
> +#define FAN_TABLE_LENGTH	16
> +
> +#define LED_CHANNELS		3
> +#define LED_MAX_BRIGHTNESS	200
> +
> +#define UNIWILL_FEATURE_FN_LOCK		BIT(0)
> +#define UNIWILL_FEATURE_SUPER_KEY_LOCK	BIT(1)
> +#define UNIWILL_FEATURE_TOUCHPAD_TOGGLE BIT(2)
> +#define UNIWILL_FEATURE_LIGHTBAR	BIT(3)
> +#define UNIWILL_FEATURE_BATTERY		BIT(4)
> +#define UNIWILL_FEATURE_HWMON		BIT(5)
> +
> +enum uniwill_method {
> +	UNIWILL_GET_ULONG	= 0x01,
> +	UNIWILL_SET_ULONG	= 0x02,
> +	UNIWILL_FIRE_ULONG	= 0x03,
> +	UNIWILL_GET_SET_ULONG	= 0x04,
> +	UNIWILL_GET_BUTTON	= 0x05,
> +};
> +
> +struct uniwill_method_buffer {
> +	__le16 address;
> +	__le16 data;
> +	__le16 operation;
> +	__le16 reserved;
> +} __packed;
> +
> +struct uniwill_data {
> +	struct wmi_device *wdev;
> +	struct regmap *regmap;
> +	struct acpi_battery_hook hook;
> +	unsigned int last_charge_ctrl;
> +	struct mutex battery_lock;	/* Protects the list of currently registered batteries */
> +	unsigned int last_switch_status;
> +	struct mutex super_key_lock;	/* Protects the toggling of the super key lock state */
> +	struct list_head batteries;
> +	struct led_classdev_mc led_mc_cdev;
> +	struct mc_subled led_mc_subled_info[LED_CHANNELS];
> +	struct notifier_block nb;
> +};
> +
> +struct uniwill_battery_entry {
> +	struct list_head head;
> +	struct power_supply *battery;
> +};
> +
> +static bool force;
> +module_param_unsafe(force, bool, 0);
> +MODULE_PARM_DESC(force, "Force loading without checking for supported devices\n");
> +
> +/* Feature bitmask since the associated registers are not reliable */
> +static uintptr_t supported_features;
> +
> +/*
> + * "disable" is placed on index 0 so that the return value of sysfs_match_string()
> + * directly translates into a boolean value.
> + */
> +static const char * const uniwill_enable_disable_strings[] = {
> +	[0] = "disable",
> +	[1] = "enable",
> +};
> +
> +static const char * const uniwill_temp_labels[] = {
> +	"CPU",
> +	"GPU",
> +};
> +
> +static const char * const uniwill_fan_labels[] = {
> +	"Main",
> +	"Secondary",
> +};
> +
> +static int uniwill_get_set_ulong(struct wmi_device *wdev, struct uniwill_method_buffer *input,
> +				 u32 *output)
> +{
> +	struct acpi_buffer out = { ACPI_ALLOCATE_BUFFER, NULL };
> +	struct acpi_buffer in = {
> +		.length = sizeof(*input),
> +		.pointer = input,
> +	};
> +	union acpi_object *obj;
> +	acpi_status status;
> +	int ret = 0;
> +
> +	status = wmidev_evaluate_method(wdev, 0x0, UNIWILL_GET_SET_ULONG, &in, &out);
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	obj = out.pointer;
> +	if (!obj)
> +		return -ENODATA;
> +
> +	if (obj->type != ACPI_TYPE_BUFFER) {
> +		ret = -ENOMSG;
> +		goto free_obj;
> +	}
> +
> +	if (obj->buffer.length < sizeof(*output)) {
> +		ret = -EPROTO;
> +		goto free_obj;
> +	}
> +
> +	*output = get_unaligned_le32(obj->buffer.pointer);
> +
> +free_obj:
> +	kfree(obj);
> +
> +	return ret;
> +}
> +
> +static int uniwill_ec_reg_write(void *context, unsigned int reg, unsigned int val)
> +{
> +	struct uniwill_method_buffer input = {
> +		.address = cpu_to_le16(reg),
> +		.data = cpu_to_le16(val & U8_MAX),
> +		.operation = 0x0000,
> +	};
> +	struct uniwill_data *data = context;
> +	u32 output;
> +	int ret;
> +
> +	ret = uniwill_get_set_ulong(data->wdev, &input, &output);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (output == 0xFEFEFEFE)
> +		return -ENXIO;
> +
> +	return 0;
> +}
> +
> +static int uniwill_ec_reg_read(void *context, unsigned int reg, unsigned int *val)
> +{
> +	struct uniwill_method_buffer input = {
> +		.address = cpu_to_le16(reg),
> +		.data = 0x0000,
> +		.operation = cpu_to_le16(0x0100),
> +	};
> +	struct uniwill_data *data = context;
> +	u32 output;
> +	int ret;
> +
> +	ret = uniwill_get_set_ulong(data->wdev, &input, &output);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (output == 0xFEFEFEFE)
> +		return -ENXIO;
> +
> +	*val = (u8)output;
> +
> +	return 0;
> +}
> +
> +static const struct regmap_bus uniwill_ec_bus = {
> +	.reg_write = uniwill_ec_reg_write,
> +	.reg_read = uniwill_ec_reg_read,
> +	.reg_format_endian_default = REGMAP_ENDIAN_LITTLE,
> +	.val_format_endian_default = REGMAP_ENDIAN_LITTLE,
> +};
> +
> +static bool uniwill_writeable_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case EC_ADDR_AP_OEM:
> +	case EC_ADDR_LIGHTBAR_AC_CTRL:
> +	case EC_ADDR_LIGHTBAR_AC_RED:
> +	case EC_ADDR_LIGHTBAR_AC_GREEN:
> +	case EC_ADDR_LIGHTBAR_AC_BLUE:
> +	case EC_ADDR_BIOS_OEM:
> +	case EC_ADDR_TRIGGER:
> +	case EC_ADDR_OEM_4:
> +	case EC_ADDR_CHARGE_CTRL:
> +	case EC_ADDR_LIGHTBAR_BAT_CTRL:
> +	case EC_ADDR_LIGHTBAR_BAT_RED:
> +	case EC_ADDR_LIGHTBAR_BAT_GREEN:
> +	case EC_ADDR_LIGHTBAR_BAT_BLUE:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static bool uniwill_readable_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case EC_ADDR_CPU_TEMP:
> +	case EC_ADDR_GPU_TEMP:
> +	case EC_ADDR_MAIN_FAN_RPM_1:
> +	case EC_ADDR_MAIN_FAN_RPM_2:
> +	case EC_ADDR_SECOND_FAN_RPM_1:
> +	case EC_ADDR_SECOND_FAN_RPM_2:
> +	case EC_ADDR_BAT_ALERT:
> +	case EC_ADDR_PROJECT_ID:
> +	case EC_ADDR_AP_OEM:
> +	case EC_ADDR_LIGHTBAR_AC_CTRL:
> +	case EC_ADDR_LIGHTBAR_AC_RED:
> +	case EC_ADDR_LIGHTBAR_AC_GREEN:
> +	case EC_ADDR_LIGHTBAR_AC_BLUE:
> +	case EC_ADDR_BIOS_OEM:
> +	case EC_ADDR_PWM_1:
> +	case EC_ADDR_PWM_2:
> +	case EC_ADDR_TRIGGER:
> +	case EC_ADDR_SWITCH_STATUS:
> +	case EC_ADDR_OEM_4:
> +	case EC_ADDR_CHARGE_CTRL:
> +	case EC_ADDR_LIGHTBAR_BAT_CTRL:
> +	case EC_ADDR_LIGHTBAR_BAT_RED:
> +	case EC_ADDR_LIGHTBAR_BAT_GREEN:
> +	case EC_ADDR_LIGHTBAR_BAT_BLUE:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static bool uniwill_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case EC_ADDR_CPU_TEMP:
> +	case EC_ADDR_GPU_TEMP:
> +	case EC_ADDR_MAIN_FAN_RPM_1:
> +	case EC_ADDR_MAIN_FAN_RPM_2:
> +	case EC_ADDR_SECOND_FAN_RPM_1:
> +	case EC_ADDR_SECOND_FAN_RPM_2:
> +	case EC_ADDR_BAT_ALERT:
> +	case EC_ADDR_PWM_1:
> +	case EC_ADDR_PWM_2:
> +	case EC_ADDR_TRIGGER:
> +	case EC_ADDR_SWITCH_STATUS:
> +	case EC_ADDR_CHARGE_CTRL:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static const struct regmap_config uniwill_ec_config = {
> +	.reg_bits = 16,
> +	.val_bits = 8,
> +	.writeable_reg = uniwill_writeable_reg,
> +	.readable_reg = uniwill_readable_reg,
> +	.volatile_reg = uniwill_volatile_reg,
> +	.can_sleep = true,
> +	.max_register = 0xFFFF,
> +	.cache_type = REGCACHE_MAPLE,
> +	.use_single_read = true,
> +	.use_single_write = true,
> +};
> +
> +static ssize_t fn_lock_store(struct device *dev, struct device_attribute *attr, const char *buf,
> +			     size_t count)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret = sysfs_match_string(uniwill_enable_disable_strings, buf);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ret)
> +		value = FN_LOCK_STATUS;
> +	else
> +		value = 0;
> +
> +	ret = regmap_update_bits(data->regmap, EC_ADDR_BIOS_OEM, FN_LOCK_STATUS, value);
> +	if (ret < 0)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t fn_lock_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, EC_ADDR_BIOS_OEM, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%s\n", str_enable_disable(value & FN_LOCK_STATUS));
> +}
> +
> +static DEVICE_ATTR_RW(fn_lock);
> +
> +static ssize_t super_key_lock_store(struct device *dev, struct device_attribute *attr,
> +				    const char *buf, size_t count)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret = sysfs_match_string(uniwill_enable_disable_strings, buf);
> +	if (ret < 0)
> +		return ret;
> +
> +	guard(mutex)(&data->super_key_lock);
> +
> +	ret = regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * We can only toggle the super key lock, so we return early if the setting
> +	 * is already in the correct state.
> +	 */
> +	if (ret == !(value & SUPER_KEY_LOCK_STATUS))

comparing integer ret with boolean result

> +		return count;
> +
> +	ret = regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, TRIGGER_SUPER_KEY_LOCK,
> +				TRIGGER_SUPER_KEY_LOCK);
> +	if (ret < 0)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t super_key_lock_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%s\n", str_enable_disable(!(value & SUPER_KEY_LOCK_STATUS)));
> +}
> +
> +static DEVICE_ATTR_RW(super_key_lock);
> +
> +static ssize_t touchpad_toggle_store(struct device *dev, struct device_attribute *attr,
> +				     const char *buf, size_t count)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret = sysfs_match_string(uniwill_enable_disable_strings, buf);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ret)
> +		value = 0;
> +	else
> +		value = TOUCHPAD_TOGGLE_OFF;
> +
> +	ret = regmap_update_bits(data->regmap, EC_ADDR_OEM_4, TOUCHPAD_TOGGLE_OFF, value);
> +	if (ret < 0)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t touchpad_toggle_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, EC_ADDR_OEM_4, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%s\n", str_enable_disable(!(value & TOUCHPAD_TOGGLE_OFF)));
> +}
> +
> +static DEVICE_ATTR_RW(touchpad_toggle);
> +
> +static ssize_t rainbow_animation_store(struct device *dev, struct device_attribute *attr,
> +				       const char *buf, size_t count)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret = sysfs_match_string(uniwill_enable_disable_strings, buf);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ret)
> +		value = LIGHTBAR_WELCOME;
> +	else
> +		value = 0;
> +
> +	ret = regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, LIGHTBAR_WELCOME, value);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL, LIGHTBAR_WELCOME, value);
> +	if (ret < 0)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t rainbow_animation_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%s\n", str_enable_disable(value & LIGHTBAR_WELCOME));
> +}
> +
> +static DEVICE_ATTR_RW(rainbow_animation);
> +
> +static ssize_t breathing_in_suspend_store(struct device *dev, struct device_attribute *attr,
> +					  const char *buf, size_t count)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret = sysfs_match_string(uniwill_enable_disable_strings, buf);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ret)
> +		value = 0;
> +	else
> +		value = LIGHTBAR_S3_OFF;
> +
> +	ret = regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, LIGHTBAR_S3_OFF, value);
> +	if (ret < 0)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t breathing_in_suspend_show(struct device *dev, struct device_attribute *attr,
> +					 char *buf)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%s\n", str_enable_disable(!(value & LIGHTBAR_S3_OFF)));
> +}
> +
> +static DEVICE_ATTR_RW(breathing_in_suspend);
> +
> +static struct attribute *uniwill_attrs[] = {
> +	/* Keyboard-related */
> +	&dev_attr_fn_lock.attr,
> +	&dev_attr_super_key_lock.attr,
> +	&dev_attr_touchpad_toggle.attr,
> +	/* Lightbar-related */
> +	&dev_attr_rainbow_animation.attr,
> +	&dev_attr_breathing_in_suspend.attr,
> +	NULL
> +};
> +
> +static umode_t uniwill_attr_is_visible(struct kobject *kobj, struct attribute *attr, int n)
> +{
> +	if (attr == &dev_attr_fn_lock.attr) {
> +		if (supported_features & UNIWILL_FEATURE_FN_LOCK)
> +			return attr->mode;
> +	}
> +
> +	if (attr == &dev_attr_super_key_lock.attr) {
> +		if (supported_features & UNIWILL_FEATURE_SUPER_KEY_LOCK)
> +			return attr->mode;
> +	}
> +
> +	if (attr == &dev_attr_touchpad_toggle.attr) {
> +		if (supported_features & UNIWILL_FEATURE_TOUCHPAD_TOGGLE)
> +			return attr->mode;
> +	}
> +
> +	if (attr == &dev_attr_rainbow_animation.attr ||
> +	    attr == &dev_attr_breathing_in_suspend.attr) {
> +		if (supported_features & UNIWILL_FEATURE_LIGHTBAR)
> +			return attr->mode;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct attribute_group uniwill_group = {
> +	.is_visible = uniwill_attr_is_visible,
> +	.attrs = uniwill_attrs,
> +};
> +
> +static const struct attribute_group *uniwill_groups[] = {
> +	&uniwill_group,
> +	NULL
> +};
> +
> +static int uniwill_read(struct device *dev, enum hwmon_sensor_types type, u32 attr, int channel,
> +			long *val)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	unsigned int value;
> +	__be16 rpm;
> +	int ret;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (channel) {
> +		case 0:
> +			ret = regmap_read(data->regmap, EC_ADDR_CPU_TEMP, &value);
> +			break;
> +		case 1:
> +			ret = regmap_read(data->regmap, EC_ADDR_GPU_TEMP, &value);
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +
> +		if (ret < 0)
> +			return ret;
> +
> +		*val = value * MILLIDEGREE_PER_DEGREE;
> +		return 0;
> +	case hwmon_fan:
> +		switch (channel) {
> +		case 0:
> +			ret = regmap_bulk_read(data->regmap, EC_ADDR_MAIN_FAN_RPM_1, &rpm,
> +					       sizeof(rpm));
> +			break;
> +		case 1:
> +			ret = regmap_bulk_read(data->regmap, EC_ADDR_SECOND_FAN_RPM_1, &rpm,
> +					       sizeof(rpm));

__be16 rpm ? returns values in cpu endian

> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +
> +		if (ret < 0)
> +			return ret;
> +
> +		*val = be16_to_cpu(rpm);
> +		return 0;
> +	case hwmon_pwm:
> +		switch (channel) {
> +		case 0:
> +			ret = regmap_read(data->regmap, EC_ADDR_PWM_1, &value);
> +			break;
> +		case 1:
> +			ret = regmap_read(data->regmap, EC_ADDR_PWM_2, &value);
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}

missing ret check

> +
> +		*val = fixp_linear_interpolate(0, 0, PWM_MAX, U8_MAX, value);
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int uniwill_read_string(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +			       int channel, const char **str)
> +{
> +	switch (type) {
> +	case hwmon_temp:
> +		*str = uniwill_temp_labels[channel];
> +		return 0;
> +	case hwmon_fan:
> +		*str = uniwill_fan_labels[channel];
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static const struct hwmon_ops uniwill_ops = {
> +	.visible = 0444,
> +	.read = uniwill_read,
> +	.read_string = uniwill_read_string,
> +};
> +
> +static const struct hwmon_channel_info * const uniwill_info[] = {
> +	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL),
> +	HWMON_CHANNEL_INFO(fan,
> +			   HWMON_F_INPUT | HWMON_F_LABEL,
> +			   HWMON_F_INPUT | HWMON_F_LABEL),
> +	HWMON_CHANNEL_INFO(pwm,
> +			   HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info uniwill_chip_info = {
> +	.ops = &uniwill_ops,
> +	.info = uniwill_info,
> +};
> +
> +static int uniwill_hwmon_init(struct uniwill_data *data)
> +{
> +	struct device *hdev;
> +
> +	if (!(supported_features & UNIWILL_FEATURE_HWMON))
> +		return 0;
> +
> +	hdev = devm_hwmon_device_register_with_info(&data->wdev->dev, "uniwill", data,
> +						    &uniwill_chip_info, NULL);
> +
> +	return PTR_ERR_OR_ZERO(hdev);
> +}
> +
> +static const unsigned int uniwill_led_channel_to_bat_reg[LED_CHANNELS] = {
> +	EC_ADDR_LIGHTBAR_BAT_RED,
> +	EC_ADDR_LIGHTBAR_BAT_GREEN,
> +	EC_ADDR_LIGHTBAR_BAT_BLUE,
> +};
> +
> +static const unsigned int uniwill_led_channel_to_ac_reg[LED_CHANNELS] = {
> +	EC_ADDR_LIGHTBAR_AC_RED,
> +	EC_ADDR_LIGHTBAR_AC_GREEN,
> +	EC_ADDR_LIGHTBAR_AC_BLUE,
> +};
> +
> +static int uniwill_led_brightness_set(struct led_classdev *led_cdev, enum led_brightness brightness)
> +{
> +	struct led_classdev_mc *led_mc_cdev = lcdev_to_mccdev(led_cdev);
> +	struct uniwill_data *data = container_of(led_mc_cdev, struct uniwill_data, led_mc_cdev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret = led_mc_calc_color_components(led_mc_cdev, brightness);
> +	if (ret < 0)
> +		return ret;
> +
> +	for (int i = 0; i < LED_CHANNELS; i++) {
> +		/* Prevent the brightness values from overflowing */
> +		value = min(LED_MAX_BRIGHTNESS, data->led_mc_subled_info[i].brightness);
> +		ret = regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i], value);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = regmap_write(data->regmap, uniwill_led_channel_to_bat_reg[i], value);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	if (brightness)
> +		value = 0;
> +	else
> +		value = LIGHTBAR_S0_OFF;
> +
> +	ret = regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, LIGHTBAR_S0_OFF, value);
> +	if (ret < 0)
> +		return ret;
> +
> +	return regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL, LIGHTBAR_S0_OFF, value);
> +}
> +
> +#define LIGHTBAR_MASK	(LIGHTBAR_APP_EXISTS | LIGHTBAR_S0_OFF | LIGHTBAR_S3_OFF | LIGHTBAR_WELCOME)
> +
> +static int uniwill_led_init(struct uniwill_data *data)
> +{
> +	struct led_init_data init_data = {
> +		.devicename = DRIVER_NAME,
> +		.default_label = "multicolor:" LED_FUNCTION_STATUS,
> +		.devname_mandatory = true,
> +	};
> +	unsigned int color_indices[3] = {
> +		LED_COLOR_ID_RED,
> +		LED_COLOR_ID_GREEN,
> +		LED_COLOR_ID_BLUE,
> +	};
> +	unsigned int value;
> +	int ret;
> +
> +	if (!(supported_features & UNIWILL_FEATURE_LIGHTBAR))
> +		return 0;
> +
> +	/*
> +	 * The EC has separate lightbar settings for AC and battery mode,
> +	 * so we have to ensure that both settings are the same.
> +	 */
> +	ret = regmap_read(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	value |= LIGHTBAR_APP_EXISTS;
> +	ret = regmap_write(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, value);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * The breathing animation during suspend is not supported when
> +	 * running on battery power.
> +	 */
> +	value |= LIGHTBAR_S3_OFF;
> +	ret = regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL, LIGHTBAR_MASK, value);
> +	if (ret < 0)
> +		return ret;
> +
> +	data->led_mc_cdev.led_cdev.color = LED_COLOR_ID_MULTI;
> +	data->led_mc_cdev.led_cdev.max_brightness = LED_MAX_BRIGHTNESS;
> +	data->led_mc_cdev.led_cdev.flags = LED_REJECT_NAME_CONFLICT;
> +	data->led_mc_cdev.led_cdev.brightness_set_blocking = uniwill_led_brightness_set;
> +
> +	if (value & LIGHTBAR_S0_OFF)
> +		data->led_mc_cdev.led_cdev.brightness = 0;
> +	else
> +		data->led_mc_cdev.led_cdev.brightness = LED_MAX_BRIGHTNESS;
> +
> +	for (int i = 0; i < LED_CHANNELS; i++) {
> +		data->led_mc_subled_info[i].color_index = color_indices[i];
> +
> +		ret = regmap_read(data->regmap, uniwill_led_channel_to_ac_reg[i], &value);
> +		if (ret < 0)
> +			return ret;
> +
> +		/*
> +		 * Make sure that the initial intensity value is not greater than
> +		 * the maximum brightness.
> +		 */
> +		value = min(LED_MAX_BRIGHTNESS, value);
> +		ret = regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i], value);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = regmap_write(data->regmap, uniwill_led_channel_to_bat_reg[i], value);
> +		if (ret < 0)
> +			return ret;
> +
> +		data->led_mc_subled_info[i].intensity = value;
> +		data->led_mc_subled_info[i].channel = i;
> +	}
> +
> +	data->led_mc_cdev.subled_info = data->led_mc_subled_info;
> +	data->led_mc_cdev.num_colors = LED_CHANNELS;
> +
> +	return devm_led_classdev_multicolor_register_ext(&data->wdev->dev, &data->led_mc_cdev,
> +							 &init_data);
> +}
> +
> +static int uniwill_get_property(struct power_supply *psy, const struct power_supply_ext *ext,
> +				void *drvdata, enum power_supply_property psp,
> +				union power_supply_propval *val)
> +{
> +	struct uniwill_data *data = drvdata;
> +	union power_supply_propval prop;
> +	unsigned int regval;
> +	int ret;
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_HEALTH:
> +		ret = power_supply_get_property_direct(psy, POWER_SUPPLY_PROP_PRESENT, &prop);
> +		if (ret < 0)
> +			return ret;
> +
> +		if (!prop.intval) {
> +			val->intval = POWER_SUPPLY_HEALTH_NO_BATTERY;
> +			return 0;
> +		}
> +
> +		ret = power_supply_get_property_direct(psy, POWER_SUPPLY_PROP_STATUS, &prop);
> +		if (ret < 0)
> +			return ret;
> +
> +		if (prop.intval == POWER_SUPPLY_STATUS_UNKNOWN) {
> +			val->intval = POWER_SUPPLY_HEALTH_UNKNOWN;
> +			return 0;
> +		}
> +
> +		ret = regmap_read(data->regmap, EC_ADDR_BAT_ALERT, &regval);
> +		if (ret < 0)
> +			return ret;
> +
> +		if (regval) {
> +			/* Charging issue */
> +			val->intval = POWER_SUPPLY_HEALTH_UNSPEC_FAILURE;
> +			return 0;
> +		}
> +
> +		val->intval = POWER_SUPPLY_HEALTH_GOOD;
> +		return 0;
> +	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
> +		ret = regmap_read(data->regmap, EC_ADDR_CHARGE_CTRL, &regval);
> +		if (ret < 0)
> +			return ret;
> +
> +		val->intval = clamp_val(FIELD_GET(CHARGE_CTRL_MASK, regval), 0, 100);
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int uniwill_set_property(struct power_supply *psy, const struct power_supply_ext *ext,
> +				void *drvdata, enum power_supply_property psp,
> +				const union power_supply_propval *val)
> +{
> +	struct uniwill_data *data = drvdata;
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
> +		if (val->intval < 1 || val->intval > 100)
> +			return -EINVAL;
> +
> +		return regmap_update_bits(data->regmap, EC_ADDR_CHARGE_CTRL, CHARGE_CTRL_MASK,
> +					  val->intval);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int uniwill_property_is_writeable(struct power_supply *psy,
> +					 const struct power_supply_ext *ext, void *drvdata,
> +					 enum power_supply_property psp)
> +{
> +	if (psp == POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD)
> +		return true;
> +
> +	return false;
> +}
> +
> +static const enum power_supply_property uniwill_properties[] = {
> +	POWER_SUPPLY_PROP_HEALTH,
> +	POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
> +};
> +
> +static const struct power_supply_ext uniwill_extension = {
> +	.name = DRIVER_NAME,
> +	.properties = uniwill_properties,
> +	.num_properties = ARRAY_SIZE(uniwill_properties),
> +	.get_property = uniwill_get_property,
> +	.set_property = uniwill_set_property,
> +	.property_is_writeable = uniwill_property_is_writeable,
> +};
> +
> +static int uniwill_add_battery(struct power_supply *battery, struct acpi_battery_hook *hook)
> +{
> +	struct uniwill_data *data = container_of(hook, struct uniwill_data, hook);
> +	struct uniwill_battery_entry *entry;
> +	int ret;
> +
> +	entry = kzalloc(sizeof(*entry), GFP_KERNEL);
> +	if (!entry)
> +		return -ENOMEM;
> +
> +	ret = power_supply_register_extension(battery, &uniwill_extension, &data->wdev->dev, data);
> +	if (ret < 0) {
> +		kfree(entry);
> +		return ret;
> +	}
> +
> +	scoped_guard(mutex, &data->battery_lock) {
> +		entry->battery = battery;
> +		list_add(&entry->head, &data->batteries);
> +	}
> +
> +	return 0;
> +}
> +
> +static int uniwill_remove_battery(struct power_supply *battery, struct acpi_battery_hook *hook)
> +{
> +	struct uniwill_data *data = container_of(hook, struct uniwill_data, hook);
> +	struct uniwill_battery_entry *entry, *tmp;
> +
> +	scoped_guard(mutex, &data->battery_lock) {
> +		list_for_each_entry_safe(entry, tmp, &data->batteries, head) {
> +			if (entry->battery == battery) {
> +				list_del(&entry->head);
> +				kfree(entry);
> +				break;
> +			}
> +		}
> +	}
> +
> +	power_supply_unregister_extension(battery, &uniwill_extension);
> +
> +	return 0;
> +}
> +
> +static int uniwill_battery_init(struct uniwill_data *data)
> +{
> +	int ret;
> +
> +	if (!(supported_features & UNIWILL_FEATURE_BATTERY))
> +		return 0;
> +
> +	ret = devm_mutex_init(&data->wdev->dev, &data->battery_lock);
> +	if (ret < 0)
> +		return ret;
> +
> +	INIT_LIST_HEAD(&data->batteries);
> +	data->hook.name = "Uniwill Battery Extension";
> +	data->hook.add_battery = uniwill_add_battery;
> +	data->hook.remove_battery = uniwill_remove_battery;
> +
> +	return devm_battery_hook_register(&data->wdev->dev, &data->hook);
> +}
> +
> +static int uniwill_notifier_call(struct notifier_block *nb, unsigned long action, void *dummy)
> +{
> +	struct uniwill_data *data = container_of(nb, struct uniwill_data, nb);
> +	struct uniwill_battery_entry *entry;
> +
> +	switch (action) {
> +	case UNIWILL_OSD_BATTERY_ALERT:
> +		scoped_guard(mutex, &data->battery_lock) {
> +			list_for_each_entry(entry, &data->batteries, head) {
> +				power_supply_changed(entry->battery);
> +			}
> +		}
> +
> +		return NOTIFY_OK;
> +	default:
> +		return NOTIFY_DONE;
> +	}
> +}
> +
> +static int uniwill_notifier_init(struct uniwill_data *data)
> +{
> +	data->nb.notifier_call = uniwill_notifier_call;
> +
> +	return devm_uniwill_wmi_register_notifier(&data->wdev->dev, &data->nb);
> +}
> +
> +static void uniwill_disable_manual_control(void *context)
> +{
> +	struct uniwill_data *data = context;
> +
> +	regmap_clear_bits(data->regmap, EC_ADDR_AP_OEM, ENABLE_MANUAL_CTRL);
> +}
> +
> +static int uniwill_ec_init(struct uniwill_data *data)
> +{
> +	unsigned int value;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, EC_ADDR_PROJECT_ID, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	dev_dbg(&data->wdev->dev, "Project ID: %u\n", value);
> +
> +	ret = regmap_set_bits(data->regmap, EC_ADDR_AP_OEM, ENABLE_MANUAL_CTRL);
> +	if (ret < 0)
> +		return ret;
> +
> +	return devm_add_action_or_reset(&data->wdev->dev, uniwill_disable_manual_control, data);
> +}
> +
> +static int uniwill_probe(struct wmi_device *wdev, const void *context)
> +{
> +	struct uniwill_data *data;
> +	struct regmap *regmap;
> +	int ret;
> +
> +	data = devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->wdev = wdev;
> +	dev_set_drvdata(&wdev->dev, data);
> +
> +	regmap = devm_regmap_init(&wdev->dev, &uniwill_ec_bus, data, &uniwill_ec_config);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	data->regmap = regmap;
> +	ret = devm_mutex_init(&wdev->dev, &data->super_key_lock);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = uniwill_ec_init(data);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = uniwill_battery_init(data);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = uniwill_led_init(data);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = uniwill_hwmon_init(data);
> +	if (ret < 0)
> +		return ret;
> +
> +	return uniwill_notifier_init(data);
> +}
> +
> +static void uniwill_shutdown(struct wmi_device *wdev)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(&wdev->dev);
> +
> +	regmap_clear_bits(data->regmap, EC_ADDR_AP_OEM, ENABLE_MANUAL_CTRL);
> +}
> +
> +static int uniwill_suspend_keyboard(struct uniwill_data *data)
> +{
> +	if (!(supported_features & UNIWILL_FEATURE_SUPER_KEY_LOCK))
> +		return 0;
> +
> +	/*
> +	 * The EC_ADDR_SWITCH_STATUS is maked as volatile, so we have to restore it
> +	 * ourself.

typo maked ->marked
  ourself -> ourselves

> +	 */
> +	return regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &data->last_switch_status);
> +}
> +
> +static int uniwill_suspend_battery(struct uniwill_data *data)
> +{
> +	if (!(supported_features & UNIWILL_FEATURE_BATTERY))
> +		return 0;
> +
> +	/*
> +	 * Save the current charge limit in order to restore it during resume.
> +	 * We cannot use the regmap code for that since this register needs to
> +	 * be declared as volatile due to CHARGE_CTRL_REACHED.
> +	 */
> +	return regmap_read(data->regmap, EC_ADDR_CHARGE_CTRL, &data->last_charge_ctrl);
> +}
> +
> +static int uniwill_suspend(struct device *dev)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = uniwill_suspend_keyboard(data);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = uniwill_suspend_battery(data);
> +	if (ret < 0)
> +		return ret;
> +
> +	regcache_cache_only(data->regmap, true);
> +	regcache_mark_dirty(data->regmap);
> +
> +	return 0;
> +}
> +
> +static int uniwill_resume_keyboard(struct uniwill_data *data)
> +{
> +	unsigned int value;
> +	int ret;
> +
> +	if (!(supported_features & UNIWILL_FEATURE_SUPER_KEY_LOCK))
> +		return 0;
> +
> +	ret = regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	if ((data->last_switch_status & SUPER_KEY_LOCK_STATUS) == (value & SUPER_KEY_LOCK_STATUS))
> +		return 0;
> +
> +	return regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, TRIGGER_SUPER_KEY_LOCK,
> +				 TRIGGER_SUPER_KEY_LOCK);
> +}
> +
> +static int uniwill_resume_battery(struct uniwill_data *data)
> +{
> +	if (!(supported_features & UNIWILL_FEATURE_BATTERY))
> +		return 0;
> +
> +	return regmap_update_bits(data->regmap, EC_ADDR_CHARGE_CTRL, CHARGE_CTRL_MASK,
> +				  data->last_charge_ctrl);
> +}
> +
> +static int uniwill_resume(struct device *dev)
> +{
> +	struct uniwill_data *data = dev_get_drvdata(dev);
> +	int ret;
> +
> +	regcache_cache_only(data->regmap, false);
> +
> +	ret = regcache_sync(data->regmap);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = uniwill_resume_keyboard(data);
> +	if (ret < 0)
> +		return ret;
> +
> +	return uniwill_resume_battery(data);
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(uniwill_pm_ops, uniwill_suspend, uniwill_resume);
> +
> +/*
> + * We cannot fully trust this GUID since Uniwill just copied the WMI GUID
> + * from the Windows driver example, and others probably did the same.
> + *
> + * Because of this we cannot use this WMI GUID for autoloading.
> + */
> +static const struct wmi_device_id uniwill_id_table[] = {
> +	{ UNIWILL_GUID, NULL },
> +	{ }
> +};
> +
> +static struct wmi_driver uniwill_driver = {
> +	.driver = {
> +		.name = DRIVER_NAME,
> +		.dev_groups = uniwill_groups,
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +		.pm = pm_sleep_ptr(&uniwill_pm_ops),
> +	},
> +	.id_table = uniwill_id_table,
> +	.probe = uniwill_probe,
> +	.shutdown = uniwill_shutdown,
> +	.no_singleton = true,
> +};
> +
> +static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
> +	{
> +		.ident = "Intel NUC x15",
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel(R) Client Systems"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "LAPAC71H"),
> +		},
> +		.driver_data = (void *)(UNIWILL_FEATURE_FN_LOCK |
> +					UNIWILL_FEATURE_SUPER_KEY_LOCK |
> +					UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
> +					UNIWILL_FEATURE_BATTERY |
> +					UNIWILL_FEATURE_HWMON),
> +	},
> +	{
> +		.ident = "Intel NUC x15",
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel(R) Client Systems"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "LAPKC71F"),
> +		},
> +		.driver_data = (void *)(UNIWILL_FEATURE_FN_LOCK |
> +					UNIWILL_FEATURE_SUPER_KEY_LOCK |
> +					UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
> +					UNIWILL_FEATURE_LIGHTBAR |
> +					UNIWILL_FEATURE_BATTERY |
> +					UNIWILL_FEATURE_HWMON),
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(dmi, uniwill_dmi_table);
> +
> +static int __init uniwill_init(void)
> +{
> +	const struct dmi_system_id *id;
> +
> +	id = dmi_first_match(uniwill_dmi_table);
> +	if (!id) {
> +		if (!force)
> +			return -ENODEV;
> +
> +		/* Assume that the device supports all features */
> +		supported_features = UINTPTR_MAX;
> +		pr_warn("Loading on a potentially unsupported device\n");
> +	} else {
> +		supported_features = (uintptr_t)id->driver_data;
> +	}
> +
> +	return wmi_driver_register(&uniwill_driver);
> +}
> +module_init(uniwill_init);
> +
> +static void __exit uniwill_exit(void)
> +{
> +	wmi_driver_unregister(&uniwill_driver);
> +}
> +module_exit(uniwill_exit);
> +
> +MODULE_AUTHOR("Armin Wolf <W_Armin@gmx.de>");
> +MODULE_DESCRIPTION("Uniwill notebook driver");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("UNIWILL");
> diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.c b/drivers/platform/x86/uniwill/uniwill-wmi.c
> index f38e4bbcd8b6..65700121ef52 100644
> --- a/drivers/platform/x86/uniwill/uniwill-wmi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-wmi.c
> @@ -161,7 +161,8 @@ static int uniwill_wmi_probe(struct wmi_device *wdev, const void *context)
>    * We cannot fully trust this GUID since Uniwill just copied the WMI GUID
>    * from the Windows driver example, and others probably did the same.
>    *
> - * Because of this we cannot use this WMI GUID for autoloading.
> + * Because of this we cannot use this WMI GUID for autoloading. The uniwill-laptop
> + * driver will instead load this module as a dependency.
>    */
>   static const struct wmi_device_id uniwill_wmi_id_table[] = {
>   	{ UNIWILL_EVENT_GUID, NULL },


Thanks,
Alok

