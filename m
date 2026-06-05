Return-Path: <linux-leds+bounces-8501-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LgCeLpvaImrNeQEAu9opvQ
	(envelope-from <linux-leds+bounces-8501-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 16:18:03 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 190EB648C62
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 16:18:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b="B5xnApe/";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8501-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8501-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10C023038C46
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jun 2026 14:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4CC023A9BD;
	Fri,  5 Jun 2026 14:09:02 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazolkn19011025.outbound.protection.outlook.com [52.103.32.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DDF3596E1;
	Fri,  5 Jun 2026 14:09:00 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780668542; cv=fail; b=G00ODYdPOVvEa4SCXeMPvUNz8isCjft0Mdr/yvZmvQzWDqmuJPYkz3w40xnPrmPJoKqhPWAaEzTrieB1sQiY0vNWdJyxRy8pNKum9uJ1e9nEvyn7oXEp0TH9GLG9HtVXATgK92ko3wi5yHLUGt7Xo72DN3nAra4DpaHEVR71df4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780668542; c=relaxed/simple;
	bh=bVb4dVLD73vend957cwaOQmJuoqLbQxSTn6m8hkGA2I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ikccBl3844y35g4XIueNu6IxqE2xSpLNEoiUkcgeTdEXEx2RrH4y+AfxIPEwvypxVzHIxilG0cQdirocTVozekJ8OH6i5r5HNfzeRk5bc209vpcLA0HB8sVdLJz0viNEz3CLFkBiXHLg3zsTFZ9nDTK930QAGv56ZW314Pm78yY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=B5xnApe/; arc=fail smtp.client-ip=52.103.32.25
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nJo/yYNTcIv9hx022p+UbBVqnwiXqctnTfNd6zK7PrTDRQJJedZgW7UGcpfY35nnQI8idGfE3I/UHxyTc19TEhFURVHGM9/YnPA7ljGUdsxhTBiqWt1TKYYpTwB8c1DA6w7FxmSc4/2unyDYBhumrz5MkeLMROZA+EonG08eR26/AABm4Oo3eVwWdrAwYvudK3Jsm20eSR6amH3tbe6nEPP20mJ3E+A/K52cOpERm2FXBf4XF5GsgYT26xY2qjtPXGdQrurlmrnQhdOxHnAQpoAbkfkRVRf0uECSG3gF04azr1JgyPBxNwLE2WFBdsKG+hhGWRDv9CeoAdJhA2ynEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vcg4OSoMCyykZ21QWBIo8kMUu6Ylq9JH7KgYHtiFdQ=;
 b=XNaV58Mznr3beODgKs563OGwBKbWqU1cij7tr2Df5neP8WZjkv6oQK/jr74UK9zg32KImQJqbq2QQNwbIXWhRPKdozZczeqewS2dYSgW9s5eyQZN3V2NrhXW3MeFgsC9KeM0Vo7JVATDpWkXW3MgQSen59zx6nBJ8dPxzmqkjrM7MX590oyBszmAHJIKjHuySPKg2vOs/9zqnx1CyOyUiDOPF5mUlJhm8SEg0L5o8/3Nct6FsDP8u2waTGictW31+HQKfsdYzvdkboh6gckCKeN1CR+hx4XCUw0AkVgae6xdZmS9v8E846MLdUQkZ3nLnxAdUBn/Mkruix6TQoM3Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vcg4OSoMCyykZ21QWBIo8kMUu6Ylq9JH7KgYHtiFdQ=;
 b=B5xnApe/xN8ZQDO0U9whvIaWjBHertvydMWva4eZfV6OUcT9OdUhsbshvds5WKi8UCtMBaGnCRtoNshmCXZ9NEm2Za45hFmCO2t9xuFvhJyObjAj22+YseJu5Q9vSQqmPPl8GXBpd73kA1nrcXVsrr0RzWUYGyUlcXICkqVurWuPNDa5kl1EFwZSAIyGz1QyOn+j+NmlAoxrhem1K+Z8+voHu5ff/jPCUtM7Q1MAcII3MjBcCrc5+YrmBVOsvWmzDkSlM0TTxUCPoZf2PQvccdF51yntDeU8xOdCLWn+aD5CfuGCR+O+lwuAyCBDFhMcgZRsNb2mRgFTLXI7UwZYvg==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by PAWPR08MB9994.eurprd08.prod.outlook.com (2603:10a6:102:35f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 14:08:58 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 14:08:58 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/9] leds: st1202: fix spurious pattern sequence start in setup
Date: Fri,  5 Jun 2026 15:08:45 +0100
Message-ID:
 <GV1PR08MB849716C684615BF0019F57FCC5112@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <GV1PR08MB849762937DA5B82DC89F1CC4C5112@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB849762937DA5B82DC89F1CC4C5112@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0259.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::9) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260605140845.1462577-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|PAWPR08MB9994:EE_
X-MS-Office365-Filtering-Correlation-Id: 4afb9a16-6107-4eda-14fe-08dec30bfc5d
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|37011999003|24021099003|55001999006|51005399006|41001999006|19110799012|15080799012|8060799015|23021999003|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wYT562Q5Hmx0sw23j88rpWweCb5Xe4bdp/9BEmWnG2OAzCdv8UfwcDNTVUgR?=
 =?us-ascii?Q?bIlBlyZdCQto4vvlCDnmA+o0Tpq5EwAUIPZF6pVa7lNeLhjQ8IDWeINJwpYq?=
 =?us-ascii?Q?r25NmKsrviG322ybsQ7kl3wx+Si4fJydGhlvhAuBB6GgnoP9SES7XdRAyoEd?=
 =?us-ascii?Q?rWxekLkBJ1/FtZeTirgIG8vIXavOVmdWuq1nedDu0WKo2YitGsYPw6m4TD1N?=
 =?us-ascii?Q?2PzLyJuZXDuXNV9LfFFdXNumKfQkXGJIGlKWfy9ObL+SGIx2gS6FQQ0HL1FX?=
 =?us-ascii?Q?vPK2pTTlTmvYtO+oIv4NIomKL3huZJKsfjdgbVgglxClsaEb7wffNbvoYgiI?=
 =?us-ascii?Q?lC+KnB50CvtwkS6UtemwD/cS36+iaXNbo/6s5CocP/Zz6l4CizIDpDKhP4Ap?=
 =?us-ascii?Q?RusDToK45k/f0gdlC5KQiLTL+LHEjxKKuXCNzDqhoL9eUxjis3fYdyGLrfFX?=
 =?us-ascii?Q?400axSeA/PLnS3LfBltX11ufoXMov1ZgBwAmNJo96RSmxVYLyFSSwnqBeZOd?=
 =?us-ascii?Q?CO3ajhXd7Wbg/GOMv0l2vjhTwEtCm4rJTzSjsJrfICVcJAEgjN2Ibpja034D?=
 =?us-ascii?Q?YbgfPx7UXFjI9sJOZf2sZ65+sbl+0T+3Mp47k5r5PTs2IlDXVn3hN4VGwe8Z?=
 =?us-ascii?Q?uUG94bkSFU0YvUBI7aqAmtymqfTJoNDrQunxAFeXfhALGCQrgL2yD6YXUe+0?=
 =?us-ascii?Q?w7mnw51VJjDEaYb+UDy3j//ZHF7fdvguSDgwFXkzTXpbDZqLKlYQ7eisw+js?=
 =?us-ascii?Q?SV0mIqzTXltM8bBLolASOpAVJx1MjCybfyrM1Tn0axpWBEBiAeq478qw+jwg?=
 =?us-ascii?Q?yi38qiu+i95hfvpvTiQ+xAv6Ule9mBLBV7sJEJI8fx40hK5HZtKv4DLVm237?=
 =?us-ascii?Q?5ZssRYPM64wmHfgJBREUTbD+qRR7JpsjZlJ8irAq1VPfL0PybyX1Udm7gSs1?=
 =?us-ascii?Q?TsxvACB6K8WXfkde+s9anUOE3H+JfcGxzMSW/6AnCVdOYcmlHZ5Th185xQ4H?=
 =?us-ascii?Q?WofeW0J/G6DKaGV6oKS4V70shW1YAv0pgfoeXOZaT0+GKag=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U4gE5KFvrS8aksNj+sQspIFlhgHBTNU+vITWt4RFXvoW3avtcTCv3wIW7mjt?=
 =?us-ascii?Q?6tQZnKHHKwIMGaPuLs8AY3eutow+nZx/FdPMUmOUcK96uH97A6tBl7Y/NBd+?=
 =?us-ascii?Q?faU6dBqWyyT4DYFNtNZ+RbSM+gqUp32cGRCQmoUcY7eoaqSrwH1/CrxaSfif?=
 =?us-ascii?Q?hnF8nqHUzdiy09hxvtOiH5Pgzj5G4cBZHOIbMqi7QFx+f7zldXo4WWrK1AF8?=
 =?us-ascii?Q?gRSCC7H6CP/T6fN3NG7i/lN1p0zzjBMp0/HXfrbsElo1pfo62rtb5eI8u5EA?=
 =?us-ascii?Q?hB7qC3NpwyL4TWe20BfOR4FZcUeskuwkO6l5eb8TYOkZU0AzoNygKeCyxm7i?=
 =?us-ascii?Q?MqwPBaLxl5HYOhcayFwIc+t/I4he8TunJfyQ8PcniUaCFUgMH7o5q/F7MKim?=
 =?us-ascii?Q?L3ar4e4fnOAYuEZtxj0XVazO8coTfZucL0t9l+1IDxXOeo7TsF0dwXwedbfK?=
 =?us-ascii?Q?6mSzvX5QSCVh2/igB9UZjfTzC3Jq+3XxSgWmlv/IS6u/hl0gY7wfpw62BZDT?=
 =?us-ascii?Q?uVDSfVQuPQ20qHsF4w4nmIxF4I/3VRhvOMgAkFCAq70/uE3ANTpDMLVTq7Te?=
 =?us-ascii?Q?RjQ8AQe+9GRHCMDekgIkL8LV1ICjQNCkpFU+iYNfKAXDcuHISIpTgt66eruR?=
 =?us-ascii?Q?leLRYsP/23U79MMW/exJBWwz2VCSJoHxkBW1Ipc/Ug9ChH06rNXIHPcxeHiJ?=
 =?us-ascii?Q?OYQh7CtySuDT35Au2bNzAOug8i2oS+2wBt1XiVs3hhf6/IgACcHNvk0RqfF7?=
 =?us-ascii?Q?t7acUUChQ7zfQ+Zg826iR2Hu1Y1v3IFn7NUKuLFwYYOr7Kn0q9LBo1flKqts?=
 =?us-ascii?Q?Q8yMxJ+Z2RugghTFmoBVeFxohdfW5HG+Z1GPF5L3v424ljuTc7jCg4ydNjBS?=
 =?us-ascii?Q?7RnoAv8AC8yQkT2YmgLBAuf10QJ2p4EaaRSgncpzTyUoue0wuPbUuxAOY96w?=
 =?us-ascii?Q?ODS0IB0v7x4tDaI4Cio91nHZe638Av+We4Gvh+eH4SyMd8KMAq0DG191odjA?=
 =?us-ascii?Q?xC2K36A+H8RwZXKaD+CA8oisbEQAr8HOQeSVEcyZP3HajlR4oSP+gotKNnR7?=
 =?us-ascii?Q?8Z7tjNCHzSYVrXROLmyCcWs3cape3smLv8DVF95vutFQDPB1ZGTyfmWrhYo9?=
 =?us-ascii?Q?L9mejbprL26xyhXpp/dQB/FJYA+PP5xlIc8i1F8AT3cPvji/ATN3PYrm9ibx?=
 =?us-ascii?Q?nIvaPZaA0to9bqE+v7K6eKA4t3795n3STPKZlooS5XtV1op9loA6ctjd+eUw?=
 =?us-ascii?Q?zSmF2v8V+vERS0JcqY5bFlxGB83xGbVy8Iq/LSV9WCkNJJvfS+XwwwnF6efQ?=
 =?us-ascii?Q?lMmwYPIfm8iNrQSBavI7XY+8bWdZGoCFUq4fxvf1q3YiCFIodQEypUQkC+n7?=
 =?us-ascii?Q?GTH8JcBGgU4ZLMWHvB3u7YKgpQ9G88O6XL10FNqDrtn2lUN1cDQZDiIWWm1m?=
 =?us-ascii?Q?7TShZWi3Ebvl1zR93K7ZYSE/YMY3IrRS?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4afb9a16-6107-4eda-14fe-08dec30bfc5d
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 14:08:58.2725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9994
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8501-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[outlook.com];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:vicentiu.galanopulo@remote-tech.co.uk,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[outlook.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,GV1PR08MB8497.eurprd08.prod.outlook.com:mid,outlook.com:dkim,outlook.com:from_mime,outlook.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 190EB648C62

st1202_setup() writes PATS and PATSR to the Configuration register as
its final step, which starts the hardware pattern sequencer during
device probe before any patterns have been programmed. This causes the
device to run a sequence with whatever values happen to be in the
pattern registers at the time.

Remove the write. The device reset at the start of setup restores all
registers to their power-on defaults, leaving PATS and PATSR cleared.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index b32d8e716372..168d14566c1a 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -341,11 +341,6 @@ static int st1202_setup(struct st1202_chip *chip)
 	if (ret < 0)
 		return ret;
 
-	ret = st1202_write_reg(chip, ST1202_CONFIG_REG,
-				ST1202_CONFIG_REG_PATS | ST1202_CONFIG_REG_PATSR);
-	if (ret < 0)
-		return ret;
-
 	return 0;
 }
 
-- 
2.54.0


