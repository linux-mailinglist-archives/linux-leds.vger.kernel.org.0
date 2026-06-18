Return-Path: <linux-leds+bounces-8665-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R5GiGBoENGqALAYAu9opvQ
	(envelope-from <linux-leds+bounces-8665-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 16:43:38 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 027AF6A0FBC
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 16:43:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=p0benGe6;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8665-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-leds+bounces-8665-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7603D300E2BB
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 14:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C94309EE7;
	Thu, 18 Jun 2026 14:43:36 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazolkn19010019.outbound.protection.outlook.com [52.103.33.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BBB19DF55;
	Thu, 18 Jun 2026 14:43:34 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781793816; cv=fail; b=ctAKdPyJszBB4sDcrIZXqQju1c38ExLedyyhuzivnbuZxWI07MS6hzTsdwCbTvaI7fZrDi0LuxPqZdY4a/3SnzaypHmWsyDdUYmQC2Kf6te7oJ0v1La1Jv+DbRvLbGpGrWCqifFC1tO09PsfPomk5IEdEocsVUar4LnV8D0iybg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781793816; c=relaxed/simple;
	bh=DnPPEQZ1dS/1Dh/wL4dLDc5hqWDbxxyzfx3SRkuqZ40=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=pjDNmLqop7j2EVBg2gP4hWdO1/3v3DYseQxH0/x89yEBuOpI/U7WMX9Fr37OBOMgw69qj3g10zczXKHXWFZ9xbdvoyTyJfzwq+LloG0hq4yPR5K4X+U9QpfMM0B2HDDDm5lAUsnEw/bqmGAEtur6V/ffkWenJJ9OR7RgJuHhrbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=p0benGe6; arc=fail smtp.client-ip=52.103.33.19
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=carcAkvzep17miBBNK4vlnUESAjzpcwxYZnruGZTTFLMkh3ScFAPsn73ZQsGo5YvUuIIEUxn1AtZzj2hx3HCu1A407z+yD7VrQoJtkOPhsX3VUqruoAp65hNWKT3jbZ1jJ727BKvO6CUsxUDIqx5m7iiXOjUsZkudCARCMzxbnMVxd9kl5wwahZOkD1xi0XSWx/Zeude5dtWjB0kDfJdhKkebBD+qYMjbPwMk7UOxOX1u0FJ54o6USDhb+Hgc3DxhDA4aybJyXc2tDI62aU9Af18FMijrEFBkugzDRVzi/Ks3sh1hmfWehsLc1OFzrFJEfjzTi7hZ/Tp5s/5Jy5tBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFLAXdn+cm9FMBC37+CZebEKJoaVRyrO8KG799B8txo=;
 b=y4flF+e0dIsK3WkSoQQImgH3kILxP9yXzVvg/lcvfX7AqLwFuWEhYjXLDzbA6ACZcFMGz1JFOC9PFypQLN4Hbh6brsIDimIN2VNyqPfyuEigO/cTgFKkTSEs57PESY97yu1j8McjO6rRwiTiiSaHhp7lmko9lVXGDR6TNa67ELn/nKj/Y/J0sRDwS7Wcla4WAtqUjWZmzwre/SEXUZ+OjKRuBesF5CM5PdbrhvH62EPk3u1eebl9OxevR8ZLkKvZ+TO05vQ8yeAfPdIK1Z6WhKmM5iCsq8vZC1RAm5OMdv/3hBOFSBFnD6KKJtDcsrGiK2OfYFFLv2Udm/eMDy6HVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFLAXdn+cm9FMBC37+CZebEKJoaVRyrO8KG799B8txo=;
 b=p0benGe6bzrfbvGA67xWATfZfvFIMvEe67ojgLLL/8HG+JuyjI3IQrxovvQNbm88dnPtnR5fIMjCtv6vtfB99uUHJA1WhvC2oWGd0XqTKsFEopGWZSU/nyFvfYhOm09Rx0uK4fR0mAtPNCAFURpLsU0yujQ2ClsmtP12RM/IXqfqDBtfSWM4AO1G462PTcZLXcfW46UlS8Hmw2T/u41KsyhpxO1/TDW5Vtw2u5stxOU7feYmgbDMrNfY4cB1GAcr6eUOw20YkcP/KdTYZqBKb8pjIe6MGyQbocR32DUN1ZFW8u480DEz+N1NjM985A4MsM0mrE5HAem2+s/y2kePUg==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by VI0PR08MB10560.eurprd08.prod.outlook.com (2603:10a6:800:20a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 14:43:31 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 14:43:30 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/9] leds: st1202: fix multiple bugs in pattern engine and brightness handling
Date: Thu, 18 Jun 2026 15:43:17 +0100
Message-ID:
 <GV1PR08MB849700625A78304DD5FFCA3EC5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.54.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0466.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::21) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260618144317.529434-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|VI0PR08MB10560:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e97ff6e-a5e7-42d6-ba07-08decd47f6d9
X-MS-Exchange-SLBlob-MailProps:
	vuaKsetfIZn9IFDOZRHBr3PkJ6iE+FIkNIatwwPBEj89WVEVJoc8op+gRukdQiJ8fXK5mWZs40A0RHNsF7Txa/PpaT/D0PmNzIu+9zUyX+cUhoJdPLnXzRbPdxNJwWlJbjpRArKgkl5fSBwaV5eY4Ln49YAIPhyC8VNum1zg+IYwnCRykitmxmnDQ1o6O0dhfp4qxDsMa9Up0ixMs6w7yAOqJDqlSNno1GwO0qXS8dmWibY2s1l/slM+dmxLMNpMAQ85uiACDrBQ2grQhdSS7exk4DLEN15kLnzmT3XVkgx9CjyvPfHeQAUQBDH5rl1S4eGK2aEpuw+E64VL+sKdt/EGFzOst3pYHFzeL0+HbS+7cgkFLrAJ1sD27ImJExHXzSZtON6rlUJKS3xBy1Jq7mu2RQFTmYR+ThRQW2j4FlvA6OaMWQAG6Sz/XmxGHNis1yVa9G/eaN2SGU1fDL/8cZ/AX+yfc+i/fTGiZb+jwdo6m0jb096YZ1pwPUURFSt8rKHk+hHjszgYa2bqbl53Jrh8zsv2rdXw0UwF7I3sJE+NQuN/yMi7gmPk0Kl0KC81+ViJCXS+JuIDWNUitrRPQbmcGhCXXvdnWl/CQDN5HGbwJQSK0l4BnwIa3ybFk3juVIn20gTWljkiOkeEJ5tNs4VqId6pXQDGWuuTj8PyLPwRLmmPexoWGH4tv0KJK3Z1xTjVI0GqMyzua7QCKcSyniMtSLpCzTwN4zJReaM456ILXS/5KEnqiuOH0e9m8RHBD5B77pvajNdX8ue707EATW5Qo+1zgyLwQ3p6XMA07WFCWUGXlsZ1yctEp3Dk2UTo
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|6090799003|15080799012|51005399006|5062599005|23021999003|19110799012|12121999013|8060799015|37011999003|5072599009|10035399007|4302099013|3412199025|440099028|1602099012|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z201R25mR0pUbjJDSDRwSzV6VGpzK3hENFZyQjd1TkpUZFlvNTZzNnBkaXlN?=
 =?utf-8?B?U3p1cmVxVEw5TFMzQzN3VXAyQnlCdjFKbFZMRGVOL1BrTTA0b3RBU2JtUjhy?=
 =?utf-8?B?eDZsZllEbHFSNit1UThyMC9DZ0NoOSs4VDJ2eTdnQktHUFhCOVU1TGJaeGhM?=
 =?utf-8?B?aHMyWTBzVHM5QTZ0MTU5YjkxYVExRzY4NFNpekdha2dwdVJ5RjlmRnFSMkFF?=
 =?utf-8?B?U2FuYXRJdVNnTXZpc2xYY2oxRm5NTjVhQjU1dUlIbmtVUExhMzdZaVRvaVQy?=
 =?utf-8?B?Nm5tVFVLWW8wN0oyazVyQ3BjZzE2SE1hUVN6MG9JTXJ3TnVGcGdBVEF2M0dL?=
 =?utf-8?B?dnlvNEZMNVAyZEIway9MK2E4KzhiTTdQQTIrMlBpRWpCSVZPRWljaytGblFk?=
 =?utf-8?B?dHhMaDVXSGsyU09YWXVTd2lyKy9zYytYUHZwSnBYNTZra0todTNmNjRSN0hJ?=
 =?utf-8?B?bGxLaGo5UXkrWHJBRjBtd290emgwdWFDc21ya2JZdm1RKzB5KzNHYkkvblIx?=
 =?utf-8?B?RGNKQmlZZkNwQ0pWVmVCM0g1UExzQURoekV6QWE0YmliRHVPRG1sQ29rdVFN?=
 =?utf-8?B?SGE4SXpmcW1oNlBLdGY0UGw3dVh1bTlKMDQ4d2hJOCtVa2t4WCtQaVovWXZq?=
 =?utf-8?B?K3Mxcm9ra1J5VEhnRktWNG9Sa3lrcHVmWGtkM2phL0hvbTdIV1VEb2JaQW9x?=
 =?utf-8?B?bmhHZTZoYXIvcXgwSzBLUyt0KzBwMFdLRXdxVm9WbXRIUDVmcFdsUng3eGdw?=
 =?utf-8?B?YXQrc3kvU2tKNFNNMURFbW5ITUZHRzlydDUwak1Wa3Y1YnAvdForM2I3VE4v?=
 =?utf-8?B?TUdETXFZcHdjNU9hK0pUSExIQnZEZHYrKytxajJuWWQva2MwUzVsTnFKc282?=
 =?utf-8?B?MDdLMUpEenMySENpNHJGVXF1VzBOdERWcHFuQWNDQ1oraTFlRXBqejkyK0pR?=
 =?utf-8?B?aTBkTVlldW1yVUNNUTN1Z2lKVTBjWEkrdHdBQkxkTFA1SzEyZnVIMklSS3li?=
 =?utf-8?B?S0djS1cvZndUejg5aFJENTFXZ1dmZWdBeG5lUUI4MDNHZndZYWtXN2p6MTV5?=
 =?utf-8?B?cHlZZTVDRWdyUmdiOHNSMVdPNVh4dDNjZkFxZ3JoUWhkcDlBR0htVHJTS3dR?=
 =?utf-8?B?bWVUYmNUV3BpbHlSS2dpdTNZNVpRY2pOT252Zndkc3R4WS9kWmRrNjZzVDRF?=
 =?utf-8?B?N20zNFFia3NVdHlKcUpXaVNtc0lwZTRDeUlxVXJxVlF2U2ZOZmYzWG41RFAw?=
 =?utf-8?B?YmhJUldCeG1WQVdrT0pKOUxhM3BGeTk5eVg5VFVoR3JwdVJjYWV6d3lSOFRs?=
 =?utf-8?B?cGZhY3BqMDlTV2NpaVVMY3B0cG5zbk12MDVaWTJhNGFmaGZKTG5tZlhocExh?=
 =?utf-8?B?R1hpdkowU3kxYlVVekRrRUZMcGtzRmd3c2FpNm8wMFlsU2tkVXE4OTBkdkxJ?=
 =?utf-8?B?bFZqaGpqc2wrRy84anJlQzdvL09uc2d6UTdncTV3eHA5T0ZPanF3OUNVaUJC?=
 =?utf-8?B?L0MwYWxkcDNoNVJVOTJCVWczY1ZvajRTYUl0Tkh5cWJkUHIrUU90T3dkcHIx?=
 =?utf-8?B?NWV0Zz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2UyNXBJc3pCOWhBUWdIYjY3WWJnOGNnbTBseVgwYlpCK1JvL0hXYTFmZmk2?=
 =?utf-8?B?eVpyOUVKSW83dzhzRDVpS1pLK3BMbWI0ODNPRE4vdEw2YzUvZWNkMThNNXV0?=
 =?utf-8?B?dU9kdUtCSDMzdXdObnNYRmlGdHhXUVRvWHN6TkxQLzV3UzdqeG0zUG4xUkpw?=
 =?utf-8?B?RW1qNHF6amlYWlpFL1FOdkZSOTlXQkk1SnlZYjVRNlRPeUNBOWxsbEwvTUVh?=
 =?utf-8?B?QXFLdVJPTE43TjFZcHlrbk5YcUJyYTNEMUI4WVZnZWxrWnU1dEFQcmY3dFly?=
 =?utf-8?B?c2RrMkZSbmxQQzB0cVdzSmxnMFBvbElISDJheWUrSU8zNGM2eXRlY3Jqb0R1?=
 =?utf-8?B?QVZ2WXdPUEhFSWFTNlZBRG84Q3hXU2FSZ3M5Ny85K2Fna0xRRmZrUkVJU3JR?=
 =?utf-8?B?aDA1T2IxK0tnMlFzYXptOXg5MzA0VDVDMHQxOXdGcVJhMlZXUnhkcE5TcTVk?=
 =?utf-8?B?Ky9wZCtRdm5lY3pSdEd6WWM5TlFNazZjcVVrb1Y3eEJuZ213RXVFVDJWSVZy?=
 =?utf-8?B?SEk5M2hIaDdCdWhFY2NEb0dteTZEMWdNRHhnYTFxN3M2bm1LNmN6OHlNd2V5?=
 =?utf-8?B?eFM4bC91bGFLbEM2UTJtZmNYNDhwbkUwR0JVMzFHQkQzekRSL2lXTlFHVnNO?=
 =?utf-8?B?REZnUVd5V2gydVlwK09BZmRQalJYMEE0aldUUS9EL29WSkU0cVlJVi9BMFFF?=
 =?utf-8?B?MGZ0c0JyY2ZwNkNtSnAxYzk4dFVoMkovcndwWGRYMWtFMDJDc0pISWRzWUZP?=
 =?utf-8?B?Q211YW1YQVVQa0FlUlR1anNpOXlIOHB5YS9kSjI4Ukk2OGZ2VXpOVFk1aUNW?=
 =?utf-8?B?RGN1blZxNGRURm1jSXM0RTg2WjhWMGkyV0hIU1NlS0FqcHVoV1JnZlB6dnZQ?=
 =?utf-8?B?Z1ZrbFVlb1NsMmk0cnp0aThUTXoxVXFsOUFhb3lkeUd5ZlJBQnQ0SVJabEYx?=
 =?utf-8?B?K1Z1UkIxdWljcVRhaXRhL0dMdUc4Rnc0TEpYb3dlcXZIVXJXRWNYSlJaUGpL?=
 =?utf-8?B?UjltMC9IVEtaalpGVzFZdC85Z1pRZXRCWWd3eFNTN2UwVnZrNm1TTWNxdGU5?=
 =?utf-8?B?ZTYzQ1VUMjMwdkREa1EvRzNzeXQvRmQrZFBNT0VzNnJRWnI2WDZ4T1Z4L3gv?=
 =?utf-8?B?Qkx6eWtQZ2xKVFVwbXF2Rk9DMWxOeGNsMTg1dkozYWJPb09LWjZLTTY5Z0cr?=
 =?utf-8?B?MFhPckd0dGhYOFAwcW1PSFRIVlJzU2JQc0oxRlBpSkVDcU9BUkpFVnBZZ1J4?=
 =?utf-8?B?L0UxNElpNHFVM3VTNUxic0c0VTQyMGhSZktMT0RDbVRzYzdRS1FyOUJieDh2?=
 =?utf-8?B?NWY0VFBVSXJSN0ZFbU0vaTF4SmVOSHBRNzNaUTdsNmkwZEpSWlpINm5SL3lv?=
 =?utf-8?B?UUtxNGo2SThobWgvMzh2RXF4S2R6d2hqaWwwbGg0Q0s4dVE3bm1UOEwvMmN0?=
 =?utf-8?B?aDgvNzVRaHFTWHhDZDlDOUhUTVFYVWsyNnlTMHlXSStyYk8zaW50UzBOdGhw?=
 =?utf-8?B?NXFTTTU0Nk9VQU00VDY3TkV2ZTZSVWdKU2dpZ1VMS0UzSjhielNMbzVXNkwv?=
 =?utf-8?B?RjE5Q1J0TFpETW9YNmtLSVVEeG9uMTdzR1B6VmhGNm5TRlI4SloyakxLaVE0?=
 =?utf-8?B?RnpvbHAwTHMyVUpxTTNVTERaMlNVQjI2bEJZQWFrTmtjK1ZWTjFyYkQrajR1?=
 =?utf-8?B?SWwxdTFsaDI2eFhMQ3JZREg0UkNKemJqUnFtSEcxVmEzUzZqT1lNd3gwS0ts?=
 =?utf-8?B?TE1MY0V4Ulltd2NRMTkweXBNalFVdDdBa1ZvRnF6OFpTOTdOYUVZYVJ1cmRR?=
 =?utf-8?B?cU50NnAyQjJEb3QxalZLUnl6QkVGZHI1ckVhRmE3eHFVM1VNN2MvY3l6UXp0?=
 =?utf-8?B?VzluK0Yyb3ZiSmRjT0s1eXlBZ0YyaGQ4MCtYc3ZOWTNLcGJQaFBnT1pzaXZU?=
 =?utf-8?Q?W4Q1e6bSUz18Uj76Am5AbJvgcaVXGIqT?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e97ff6e-a5e7-42d6-ba07-08decd47f6d9
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 14:43:30.6973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10560
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8665-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,outlook.com:dkim,outlook.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 027AF6A0FBC

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
 drivers/leds/leds-st1202.c         | 109 ++++++++++++++++++-----------
 2 files changed, 74 insertions(+), 44 deletions(-)

-- 
2.54.0


