Return-Path: <linux-leds+bounces-8258-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMMeEt0nDmpq6gUAu9opvQ
	(envelope-from <linux-leds+bounces-8258-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 23:30:05 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC9E59AEE0
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 23:30:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C6C5C3187A4C
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 20:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AD24331209;
	Wed, 20 May 2026 20:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tu9jzpTC"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5AC355048
	for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 20:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779307425; cv=none; b=OIaWfh6HStl5x/IJfj17mgMhg1SPPAaJddrKAtH46qDF/lVCTHt/qeAQEFky99W3oN1NDFUb4STsedwmE2Ecl59BgdeqPU9/Y16WT6Vkqr080ITDHtVaDnas7qWhqONAXMxdCGq+j4GW+h890moi/asgafUmL8aPBMuqWW/4aUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779307425; c=relaxed/simple;
	bh=Xvv5fQ5F5xIWtEaWElIAcf+23Bvf0pXPnm8EdudGugA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dswh8/UwH2ucfHFjCgNvcx9WMpqiFp9WgjzJqLQr4LSTKB0OMuU2fhdjeMYImk3s7BjSBy9iG3he+MFsb1oWmVerCSlv+s+bWNyR/n56Zq5KD33lRNAuIqP+NXHqyb8AJJialVUbSZxDWJDoV10jCQ7P0IrAawJLhp8TidYbASs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tu9jzpTC; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-50e5c5033f6so46583591cf.0
        for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 13:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779307423; x=1779912223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pPtDRaFJhpJpi9KrC1PwJKKtOYZtFzoBHFHqlj56RU=;
        b=Tu9jzpTCpVUUoJ2IHa+AOCrOEK2khueqdyh8456OVxgl9CnlLHpAVWtg7SQmuv8yAY
         brFTb5lHB/7KRCQ9hZVHlCNnhHnIa18EqghllofejEoi9MKiOkjQ6X/S8rJ6YRTbhW4l
         Mm2eOUqgMrXDrrL2r/quvFaux6JCmxxHUUob97km6GDbNT+d12cLCRNXZy3FZDRjB6aM
         xzBOzH4jp4gGRKDOnMm+zGDEbzfNGrrKO23i0nWPePaAt0eYHaRVlQcQHKdHjN36o2nh
         s9LFDdpAFssZ8X9wPwBpIUlgzq/DT6jfIJglWLm7xgAXwAdQRTy7wHxmq1eeZtFfnxi0
         9NdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779307423; x=1779912223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8pPtDRaFJhpJpi9KrC1PwJKKtOYZtFzoBHFHqlj56RU=;
        b=WXOga+K5+zkhECamVq1q+AO31ax0IQoL1W/HY+MqfKMYZfA5NkiFFJqwrn6S3qfaHG
         cqH9QgHN3l/hqxPivVV+ROtGfxcGCozDF5iOpZffzvz9+uYmhCTAhWmsgJ+w3dzfFhSe
         moeJkvncPXEhPjU6aUvSpcNZqGryoB8YsSfYaE6wCqBNj5PvPwFwvbN5fCkkR5rIneGT
         IcXOkPvGpICtCWu6h+sMaJua6OnsuvSX9Oc1/8qnk80FfGmr5QLJ8xbH1Z+1nPjzYoCV
         NoYcUqgn4obHPfxmvgIi+e8D38ya/4tThoMR0Z169X+OqkzlmJ2iTzYqB4CYYJYEUZHg
         3aFg==
X-Forwarded-Encrypted: i=1; AFNElJ+NzzQRdviTDgLNIL1OQvSjtDjpQ2zSrNs8pi/9lRfQi462ogt8DmukKJmlccXJgKLAGqjwnH86kvxo@vger.kernel.org
X-Gm-Message-State: AOJu0Yx88091/FA69hr0k3g63X2EtFSKRqat3L0CBsWXeAB0hPAm/TL3
	uWCe2aZ6tHHDSg0/vQPH0oCGTfa1hQ3I46rx/TeL3YuiFvSlo2gwOw3w
X-Gm-Gg: Acq92OESOTv6QgTsHV/KGit8bNqCdkVmcs90yYPBs8ZMnN9uGOAZWHUaWAN+Mmc2AQm
	183Ot3shzYHnUtzG99eIlNvt5TarjISf0cfWsHNnvwN/whjN3IsUUjV4sdjUW1Xuq/qFIqN8bvj
	gpnSgiKvsKvsdPIDxPQ4WGZy85pqniM7oZS2k3MgTn2kPv8KLtczbaGuX71sZCFayO6PFLwU4Bw
	lLy7TRiLG0WWVPvAIPCTkyfcofhH8GhdL/ui160WXoVaXdDxrnZfiF0alCN4Dkg53lete2thyQE
	l6IubGE6/vpGjp6iW3NrZfzaI9+T3LTdt+7fDuH15f/c3JTkYPGxPL97ufkb6hu6+IhippqQQYv
	U1fP1ThRbaT87PYEX3zFyBUPra/ZfYLSR0hgCRyE6Dm1U4UnnR8Xd2evNJ6/MAl6SQy/xS2PNDC
	TvYLgPwvHwTyv2ntFBM6zaZKHZW+QzjhJQL6ywLe1oJibjlHpTCwe+coPZ
X-Received: by 2002:a05:622a:d1:b0:509:1b76:e9b2 with SMTP id d75a77b69052e-5165a276812mr354941421cf.55.1779307423016;
        Wed, 20 May 2026 13:03:43 -0700 (PDT)
Received: from PF5YBGDS.localdomain ([163.114.130.1])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-516514e0b91sm188849301cf.15.2026.05.20.13.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 13:03:42 -0700 (PDT)
From: mike.marciniszyn@gmail.com
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Daniel Golle <daniel@makrotopia.org>,
	Kees Cook <kees@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Lee Trager <lee@trager.us>,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	Chengfeng Ye <dg573847474@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: mike.marciniszyn@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next 2/3] net: eth: fbnic: Store max_speed from firmware dialog
Date: Wed, 20 May 2026 16:03:36 -0400
Message-ID: <20260520200337.204431-3-mike.marciniszyn@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520200337.204431-1-mike.marciniszyn@gmail.com>
References: <20260520200337.204431-1-mike.marciniszyn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,fb.com,meta.com,lunn.ch,davemloft.net,google.com,redhat.com,armlinux.org.uk,makrotopia.org,gmail.com,intel.com,trager.us,oracle.com,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-8258-lists,linux-leds=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikemarciniszyn@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 1AC9E59AEE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: "Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>

The OCP spec required LED signalling to signal the difference
between both below and at max speed capability.

The firmware init dialog already contains that attribute
so store it to support follow-on patches.

Signed-off-by: Mike Marciniszyn (Meta) <mike.marciniszyn@gmail.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic_fw.c | 3 +++
 drivers/net/ethernet/meta/fbnic/fbnic_fw.h | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c b/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
index 0c6812fcf185..59015769ca28 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
@@ -561,6 +561,7 @@ static const struct fbnic_tlv_index fbnic_fw_cap_resp_index[] = {
 	FBNIC_TLV_ATTR_U32(FBNIC_FW_CAP_RESP_ACTIVE_FW_SLOT),
 	FBNIC_TLV_ATTR_STRING(FBNIC_FW_CAP_RESP_VERSION_COMMIT_STR,
 			      FBNIC_FW_CAP_RESP_COMMIT_MAX_SIZE),
+	FBNIC_TLV_ATTR_U32(FBNIC_FW_CAP_RESP_FW_MAX_LINK_SPEED),
 	FBNIC_TLV_ATTR_U32(FBNIC_FW_CAP_RESP_BMC_ALL_MULTI),
 	FBNIC_TLV_ATTR_U32(FBNIC_FW_CAP_RESP_FW_LINK_SPEED),
 	FBNIC_TLV_ATTR_U32(FBNIC_FW_CAP_RESP_FW_LINK_FEC),
@@ -667,6 +668,8 @@ static int fbnic_fw_parse_cap_resp(void *opaque, struct fbnic_tlv_msg **results)
 
 	fbd->fw_cap.active_slot =
 		fta_get_uint(results, FBNIC_FW_CAP_RESP_ACTIVE_FW_SLOT);
+	fbd->fw_cap.max_link_speed =
+		fta_get_uint(results, FBNIC_FW_CAP_RESP_FW_MAX_LINK_SPEED);
 	fbd->fw_cap.link_speed =
 		fta_get_uint(results, FBNIC_FW_CAP_RESP_FW_LINK_SPEED);
 	fbd->fw_cap.link_fec =
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_fw.h b/drivers/net/ethernet/meta/fbnic/fbnic_fw.h
index d84723e4cfa3..55c2ebc223d0 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_fw.h
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_fw.h
@@ -58,6 +58,7 @@ struct fbnic_fw_cap {
 	u8	need_bmc_macda_sync	: 1;
 	u8	all_multi		: 1;
 	u8	link_speed;
+	u8	max_link_speed;
 	u8	link_fec;
 	u32	anti_rollback_version;
 };
@@ -241,6 +242,8 @@ enum {
 	FBNIC_FW_CAP_RESP_STORED_CMRT_COMMIT_STR	= 0x10,
 	FBNIC_FW_CAP_RESP_UEFI_VERSION			= 0x11,
 	FBNIC_FW_CAP_RESP_UEFI_COMMIT_STR		= 0x12,
+	FBNIC_FW_CAP_RESP_FW_MAX_LINK_SPEED		= 0x13,
+	/* 0x14 reserved */
 	FBNIC_FW_CAP_RESP_ANTI_ROLLBACK_VERSION		= 0x15,
 	FBNIC_FW_CAP_RESP_MSG_MAX
 };
-- 
2.43.0


