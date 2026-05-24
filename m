Return-Path: <linux-leds+bounces-8306-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEDxHTp8E2ogBwcAu9opvQ
	(envelope-from <linux-leds+bounces-8306-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2026 00:31:22 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F72F5C494E
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2026 00:31:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 03928300184E
	for <lists+linux-leds@lfdr.de>; Sun, 24 May 2026 22:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF69132142B;
	Sun, 24 May 2026 22:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="FOXWu+sZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from WA2P291CU004.outbound.protection.outlook.com (mail-polandcentralazolkn19012054.outbound.protection.outlook.com [52.103.53.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4285B2F4A05;
	Sun, 24 May 2026 22:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779661875; cv=fail; b=JcqU8bG0bPBlp88HB7ECoA/splEFexFx1LBil6qw3qj4W6152w/MCFDpDLbzfdK5JtBNydPXCn+Ham/C1qO8+GeB8MavsS2MWmMTMWoIZgsIHHw23J96rRjWtm2P/fmwS9insWxbvAY/yvJ/Mhzggsb0TA23wcQMI6Pf9c9Jg9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779661875; c=relaxed/simple;
	bh=2zfe6zbAFR+zEWd85z604M6BDQtc8vNMH/lm0F5FFZU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=USM+2QxlFmKMYsGCt1A5Ozee+RKg+Rp6a9Zt0VoVrTBpjIG7RWP/1fCDPVXA6vyXuFAeeb7GsTXIsh3SWlnNMb7IwQHmT/tM1r4KnaBACHbA2ExsCUxK1uOTqsUZgyyYVmJM7XjqcjL6yw/N3zHeBzMLJA3xDiytMxbWUYiLf5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=FOXWu+sZ; arc=fail smtp.client-ip=52.103.53.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KFrO/iPSkuaQ4GCNHs65SE/xBH09bhPrYH/9ElTsP0u4UcJ9D+FORo5U8saRlaCiP7xHzGRXC2SNOnKm6Lq/iSM28VmkFRJ4lRAgT01RlhSfoQDhEHloSYHpGL7QBpPgH0oWzIzP/ibAr6fmbsp+1N1Nn1ghvwe339tJ74b384dSK0FokI2Ayl12Po3Wm3eFxk14Hnpb/XoS942ZUBGY1cuBPB+rcderl629Dz8OIC+ldY7Fy58KRPfT4XR3OP2dT4d7wqDbroaAFGEZkjfAEA8HxXDUhBYccT5NH6EPMDLaPTzlFU5ZR1egnBFuoRxF2+lVOU4cqACrhJhkrIf4Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wr7eWBXEQOHQvTQprLYOCuJuOuhTf0KtAc0IMC7Td/k=;
 b=PVFLca19Nk0mVuG31oWkHcHXxwb61gRnXKr11Lz8rjJr2GaB7B91kEelTLpaqWVonOJsm5vPVtP39jEGVUZaH5tx/qsDYXC2ZJqvdCclvTxB+pREzQ5q5gQsk4gAquZVrvf64IQvcfjO726+jZ4ZCvycMBneUXXoxLI/EAHS1fwUTA3yklMfrIc6dfmpFQwUq81QfC0PeDALXw6cTczNjGGh02n+z1Dfl0hpS8ZK1s1GKswCmaR83+4ByXazX9wGBOwiebsVUiCfpUqTaH9wQmUwBAhks8q26+MYcr8t3BsAN1c1wFtMrd5nV5FqDHpSPSuuyY4nNMOGR9laVNBLZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wr7eWBXEQOHQvTQprLYOCuJuOuhTf0KtAc0IMC7Td/k=;
 b=FOXWu+sZ+lqrG8abOcS2/ugWkssStuOTssoY7MfA0aTfV/NV4mDcfLLzy5lok6YcgBxVakVDyd+9CyuVsD8SzSFGPH5g3zT6nNH1rt6xjzTG9XB9GzIT38SZUSrcSuwNhRIPgb97vXaMVIaB4IslrT+7C/s/cWie5su081v8I3Dp/uWsjYd6U8Ea2MndqCUwiEYB5CARUBdGZJquRido5ydP8FRDEBZ0wvNEpZQGVZXRwdUlYohtIuhkWCYYerR42O3QYUuYg6TaZxV+dWzbcGHX0QiRgypdbarFAdOUGcC3GB0mj2ME3aFWl6xZSdcTYH/1XJI9y9FBiiq9pMUpDQ==
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:e::21) by
 WA0P291MB0195.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:f::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.16; Sun, 24 May 2026 22:31:11 +0000
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6]) by WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6%7]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 22:31:11 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/10] leds: st1202: correct and extend hw_pattern documentation
Date: Sun, 24 May 2026 23:30:58 +0100
Message-ID:
 <WA0P291MB03851A08375F03F671DCDA9FC50D2@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <WA0P291MB03855101311F0506B6448A8EC50D2@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
References: <WA0P291MB03855101311F0506B6448A8EC50D2@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0107.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::12) To WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:e::21)
X-Microsoft-Original-Message-ID:
 <20260524223059.398003-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA0P291MB0385:EE_|WA0P291MB0195:EE_
X-MS-Office365-Filtering-Correlation-Id: 98464ec8-9702-4c1e-d6f2-08deb9e42817
X-MS-Exchange-SLBlob-MailProps:
	ScCmN3RHayEFd6bE9WNU4GTjq5AfDX0ktCq0TOblW7nqjN/ipMl3kqY7LnGOvpXbedAjswBLVdTmHVWCF4eQsK6FzJA8Ck56zJZSSEOZQdRAPpvXNLlEsrtf0tNNNHCrVBuFVYSK+I4HQB+qFPibbv9ougiUOm1uIhBhEQUsR5rt16ZLxGxZd/cYdwdhbvQMELPAdedY1p2SfGwypa/P9abil2+Ps1nNEjwSe41q13+wudX5mWWzXHYXC2oRePHAZPKmd5Tv+ErDO22st5qbOQiXUDcisR0n2Lr/8QWLDRNnHgTh4N0ukrjWcBY3nZmaMXajPa4SC6L+jcMUtvZxHoLgQy8nFMoyy7CKGEFSOghflxtbKrA839toH17tpvPwWN0+lg3bYi5UnR48R9P+y03mh7YRIh7AGbz4mGypqSnsjL4fAVJapXCCQqquwnxdj4JxHOvbRkMAAI+P+WjGtdEw7IMu8nngzT8q2mlO/11eZS+k9fqC3p2aesHhi63h3LYVDPudsJVaJIKLJ7XAAOhNhOzA9EqSEikufWiWcrNxq9uDoX1Bn035MlsJwiAfzCj1d9JZevnFNjIk/VnI1TLpa/ujUOPUuTnK8bz0BL2tQkiekgqlDUesYbhw7LZujnAfYvL3JKyWARUGswG3OvX6LYTAXCyeAKYS7/uXrvdzyfdPzAvzg36xfFV053JumBUKyCsDj8Bugy9Gi5ocIcERr1HVZnO2UM2xSACuthQ=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|51005399006|37011999003|55001999006|15080799012|5072599009|41001999006|8060799015|19110799012|16051099003|24021099003|23021999003|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PF8UPQcxT4byJGDHDitwQ/Z6d8/2tlyZhZSyt+8Y0h1VdWrQdbeXmgtzvaur?=
 =?us-ascii?Q?4FYbg7ZCol/n6oC9EyUfECl+SQiS8rRcaFWlCBarE+cXnVyZ+y1fcM2uxB5M?=
 =?us-ascii?Q?haoQXMo/XEgFbJLSVx1wfzRGEpbqQjj7WYtTyCC3SXOASU/4A6Hw2VxnQLz+?=
 =?us-ascii?Q?eV//4AH/Spsj2cr+0q+yCEP/2EIMaNl+EkCh4hX9ThJWYOpX3IADVA7mMHWd?=
 =?us-ascii?Q?aPGXSBerJgpvdC8rfXbY4Yfxk57L+noLeB4UKY6pjnQf0WCt+Nld+VFME2PC?=
 =?us-ascii?Q?M3ycddu086gynVlAdq12Zu1+QL96wlw5UYJUzugEKSiYcZsrDKNOTLHNg16J?=
 =?us-ascii?Q?nkqfluQWbRDBclBALGgglCxsa/H9UyjCH+v66/B/KEwuyGPTr/75YSpomvZF?=
 =?us-ascii?Q?2DONXnMO+4YhnKSr29LJUyHy+wmyq5RDgYtpo9hl/EZ5uNHtEMHQYs8Rgwvm?=
 =?us-ascii?Q?Ghs3mS48fS65rWQDT9PD96nPDLOUIv9P07+zc0pv2y8QQxS4cAP5ubcbFhGY?=
 =?us-ascii?Q?e4l3PsHhOqXGf6F1jH28g1Od1WBXQacohSXYorJVTKtXOWMtqkTIqYIxAORT?=
 =?us-ascii?Q?Yv13ViBgGebr2ZfmVNNVwwxq7wpJcg4vpTBrdHAiOGXgbkRXtJX2zi9vAb7M?=
 =?us-ascii?Q?BaLIMXw+B73CiY7qo4iZp2XZIV+09jvun8E2rX9zi3JvOT+FmnROVSC+N8VT?=
 =?us-ascii?Q?oDDysRtQSKG7hfNZ280/HW6bS+OTLsTSP7URYQTVecTVLQz4hFATs4/J8HZ+?=
 =?us-ascii?Q?eIUeFcd5UjBlXmS5ZLQzbKw1cWzdJRIGQ+LEuEMlptdkw4y7F/0p4CDveWiY?=
 =?us-ascii?Q?JtdNkOMRn/6dUC9lqEOnrbHevwfpJyxJtUpARZziY03iGdWI0QLHEvx+2329?=
 =?us-ascii?Q?7tZ43CWx6n3nnbfLcZwoQuFRqmp4nfWJJ3zaUCuNOz7+LA37q58Tb7pQPOM3?=
 =?us-ascii?Q?7YFyWGKQhDvOr4G/djnO9CHH+FTih7k/25ap7kI9io+gEPLIMYKcUSuNdA3H?=
 =?us-ascii?Q?1V8SiQ34aW4XTyvSVYHzk1IzwV5ZU8iqK5uY5APKh//YJVCj9QWOgmDdjqMy?=
 =?us-ascii?Q?ONZuST9j?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6nr/NF2lBwavCRprxtRv0QlwEV4+wUmo+e7qza98Pqo04d7pIKm913vDYEYa?=
 =?us-ascii?Q?2CRIAuFzHi24XXhuofgq20+fAFaF5m101uWdqWgjiJjsHFxIajZUbkW31UT6?=
 =?us-ascii?Q?+fw+S8TmkCFWuxLKetzdxEu2LA+6N2FPnXYQ2ENmxSLg3rszy4mKUxOe8w/i?=
 =?us-ascii?Q?LEUtLxXFs6YWfYCylGB8IeIz7HeR89mJ3z5NTV1Z0JrL3OAU6HKLsawJGjV+?=
 =?us-ascii?Q?d1B5e02eDSR40ypU6INmXcb6nqv8o39EcY0OVkIiPl8ZwOA/NpWwui4OAHp+?=
 =?us-ascii?Q?6HsPCG6oB6Adpjox63OWqJhv5mkZJK55Byq4E0WUHTEox2aqazjYFnxwiqQu?=
 =?us-ascii?Q?0bC6Y0ZlsMSM+tCJAk0gaB0nZCrOEWb1Vh9x2EsfoKqVKFs7hFcq3iXTr7DI?=
 =?us-ascii?Q?jKhZniIu3pn2UDA2gHvJl4O6itZJX5JLtRhYwqjMudOkH3oz73uMZfqXko23?=
 =?us-ascii?Q?X6u7B6OF06w4wqd7efYNuTCrgpxhwPE+K0NOaHaSY8EI0tF8qjSP5xy15de7?=
 =?us-ascii?Q?x/IcUmuu35Pp1W3EJ7ZKEbhPcUFmzdnFk+cAQvrWgQQvBiyxK6Bx+/CzR+xd?=
 =?us-ascii?Q?9vveZFdhvkJ90WYTFqOwvkNb8jyO3XkwmfiW0ZKsLsMrPo88eolUcbcRnOCW?=
 =?us-ascii?Q?YF4G0+d4CQcC5A0OhreBloQJNFnzF8wZDV+m0UTflvkZW3208kL6tYHRek2o?=
 =?us-ascii?Q?6+YQJL9E1b4VC3Fcw0xwrAPQHCUwCFJ9lg9r36XWj2CK/QESSPoENl009dqi?=
 =?us-ascii?Q?Oeep7RBaJ/BgLE7PH2VIoi17l+O9WEbMHXCXwkYFaMCr7o5lZi+Iom4BiiHZ?=
 =?us-ascii?Q?aOR8uTU4WzQL9BwwTJ0QHBDIrVcLLnOBKVL8C1yz3tyvixx0oCGoAzyHs0S3?=
 =?us-ascii?Q?5SLfDGyBd9mzVojRpn3tGS8FxVimR0l2iuNj+nM1acbfRE0ZPtJ2GHyA7lc4?=
 =?us-ascii?Q?TOIOwa3u2qqlck/sDxSXlyKKONPeNmi3DBH3ws7bZtqZHV9ny1a0gWoaECI/?=
 =?us-ascii?Q?6p7hI61byx5VOQx74xz0qac9aZyaTan9jjqRD85G7fWPKaJeJxKqY7Hpn/pq?=
 =?us-ascii?Q?xRfX1CdEkuB7CGH8RpVDZM6lkjjmrnOnxGe0JVF8sfkamCCOE8lZzD1D/qhe?=
 =?us-ascii?Q?rPuwwP+1+tOiT3KSaw+ZYTD2wdsNopv8OBIfk3YdfgJCOycIQqOgTn9ISFfo?=
 =?us-ascii?Q?2q/I2j5jkhohoylo2tLEnWhOqrUTipfgfa2LX6aHmxI7kgQXYRW7VOFOGvOW?=
 =?us-ascii?Q?QHvF19DFLqu5BIAuu0DQEr8x8ELwvkJokCXsvgtOFL2TlPSTUIH1ejOIVzu/?=
 =?us-ascii?Q?6n6gVXwlGp0XJbBWDq5DFUmLf3FXcQig1WIgkjzKM4sEtd+pPW14KjaaWbCr?=
 =?us-ascii?Q?EzgsF3qeqTjRBAfS46Yu7oOwYuLNGYIhs8rU3KWbhHfGFXUnMJKewECfZSeJ?=
 =?us-ascii?Q?RnOqjPmDIwy9zHpPSdxHmhxavfdqzUZL?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98464ec8-9702-4c1e-d6f2-08deb9e42817
X-MS-Exchange-CrossTenant-AuthSource: WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 22:31:11.2107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA0P291MB0195
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8306-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	FREEMAIL_FROM(0.00)[outlook.com];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[outlook.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,outlook.com:dkim,WA0P291MB0385.POLP291.PROD.OUTLOOK.COM:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 6F72F5C494E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix the repeat section: -1 is a valid value meaning infinite repeat,
as accepted by the ledtrig-pattern sysfs interface; only 0 and values
below -1 are rejected. The previous text incorrectly stated all negative
numbers were invalid. Also remove the redundant trailing sentence since
the behaviour is now covered inline.

Add the brightness range (0-255) to the hw_pattern section, which was
previously undocumented.

Fixes: b1816b22381b ("Documentation:leds: Add leds-st1202.rst")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 Documentation/leds/leds-st1202.rst | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/leds/leds-st1202.rst b/Documentation/leds/leds-st1202.rst
index a2353549469e..ed32eb3a27d4 100644
--- a/Documentation/leds/leds-st1202.rst
+++ b/Documentation/leds/leds-st1202.rst
@@ -16,6 +16,7 @@ in terms of PWM duty-cycle and duration (ms).
 To be compatible with the hardware pattern format, maximum 8 tuples of
 brightness (PWM) and duration must be written to hw_pattern.
 
+- Brightness range: 0-255
 - Min pattern duration: 22 ms
 - Max pattern duration: 5610 ms
 
@@ -26,9 +27,7 @@ The format of the hardware pattern values should be:
 ----------------------------
 
 Specify a pattern repeat number, which is common for all channels.
-Default is 1; negative numbers and 0 are invalid.
+Default is 1. Writing 0 is invalid. Writing -1 or 255 repeats the
+pattern indefinitely.
 
 This file will always return the originally written repeat number.
-
-When the 255 value is written to it, all patterns will repeat
-indefinitely.
-- 
2.54.0


