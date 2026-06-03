Return-Path: <linux-leds+bounces-8449-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 64vTFVyDH2rEmgAAu9opvQ
	(envelope-from <linux-leds+bounces-8449-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 03 Jun 2026 03:29:00 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BEB6336C8
	for <lists+linux-leds@lfdr.de>; Wed, 03 Jun 2026 03:28:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=EWUdj9fA;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8449-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8449-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C85D302B836
	for <lists+linux-leds@lfdr.de>; Wed,  3 Jun 2026 01:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE04E34AB01;
	Wed,  3 Jun 2026 01:28:53 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D177534887E;
	Wed,  3 Jun 2026 01:28:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780450133; cv=none; b=ZCappEyXciLxv1ft8hco/Nblehm2vVL2T9bAP7gxOZ1bfCG8+BjEbaNY50QG9BGRy7yCVGEOJrpd1OQfl3+pQUb53aqYSxTBadOaPTZJ7xQseHNoBulsx6tzzckeAjYQfsYxePJroYvFHwK7cbX0jK+8mwIWHKFmR5zDNj9yVnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780450133; c=relaxed/simple;
	bh=KCmx0oUzqFC2V3/udz4NXx4Bu7QND/lzq/VeBMiErZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AEvSMUmjRMkMX8QUQMdsJYpuueOLJqCq2xh9jetP2v1+ctHjSpi0WQCU2dWrFCvWDHdkzfxrD4E4qe8hr9RLleB3o63h39z13zfRGh/2AQas4wnaG+/x/rDD+SuxkXubqxvkTmySgYYK9I1RhVGQn94Q/9EwFhv1d0sur5pgoFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EWUdj9fA; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A226D1F00899;
	Wed,  3 Jun 2026 01:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780450132;
	bh=KxYQiLEBkIHFcHWPhz0mEP8z51C/NkK9n4TA94/zYYU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EWUdj9fASuJXfHMWyVczd87JhHSNqV5riWL+BqMz5oBiQNEHhV5XHM54movAN75EO
	 UbQXK5BjfAQy4IealhO59QffGSVn3cHYgvxiOlSM778wqOgIpxwV7bBAsKMVD2qB4h
	 bea9e+uCdpLVyUPzGdmGqUO0Pkv+GtmRvmxozwi8U/12II+SHTdbTktxbzCKjufhb4
	 BOyOQqssY6D9fy9nXXqF2rUfRzBh6LPm/DVGHs6PNW1OhO/y9VqALr8uxN/E5G6/oO
	 8mKLqHuqR6bqnrNPMGWIeVUUVMqvKTvfYI3fKPQvLWzt5QqpLU7zAQqJWyfQl76PSl
	 Zqowobcx/6OmA==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	jakub@cloudflare.com,
	maxime.chevallier@bootlin.com,
	nb@tipi-net.de,
	lee@kernel.org,
	linux-leds@vger.kernel.org,
	pavel@kernel.org,
	jv@jvosburgh.net,
	michael.chan@broadcom.com,
	jhs@mojatatu.com,
	vinicius.gomes@intel.com,
	idosch@nvidia.com,
	razor@blackwall.org,
	hare@suse.de,
	jhasan@marvell.com,
	danieller@nvidia.com,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next v2 03/11] net: document NETDEV_CHANGENAME as ops locked
Date: Tue,  2 Jun 2026 18:28:32 -0700
Message-ID: <20260603012840.2254293-4-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603012840.2254293-1-kuba@kernel.org>
References: <20260603012840.2254293-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-8449-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:davem@davemloft.net,m:netdev@vger.kernel.org,m:edumazet@google.com,m:pabeni@redhat.com,m:andrew+netdev@lunn.ch,m:horms@kernel.org,m:jakub@cloudflare.com,m:maxime.chevallier@bootlin.com,m:nb@tipi-net.de,m:lee@kernel.org,m:linux-leds@vger.kernel.org,m:pavel@kernel.org,m:jv@jvosburgh.net,m:michael.chan@broadcom.com,m:jhs@mojatatu.com,m:vinicius.gomes@intel.com,m:idosch@nvidia.com,m:razor@blackwall.org,m:hare@suse.de,m:jhasan@marvell.com,m:danieller@nvidia.com,m:kuba@kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kuba@kernel.org,linux-leds@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B3BEB6336C8

NETDEV_CHANGENAME is only emitted from netif_change_name().
netif_change_name() has two callers both of which hold netdev_lock_ops()
around the call site:
 - dev_change_name()
 - do_setlink()

Document NETDEV_CHANGENAME as always ops locked.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 Documentation/networking/netdevices.rst | 1 +
 net/core/lock_debug.c                   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/networking/netdevices.rst b/Documentation/networking/netdevices.rst
index 60492d4df2ee..8fc96975b3bd 100644
--- a/Documentation/networking/netdevices.rst
+++ b/Documentation/networking/netdevices.rst
@@ -415,6 +415,7 @@ instance lock.
 For devices with locked ops, currently only the following notifiers are
 running under the lock:
 * ``NETDEV_CHANGE``
+* ``NETDEV_CHANGENAME``
 * ``NETDEV_REGISTER``
 * ``NETDEV_UP``
 
diff --git a/net/core/lock_debug.c b/net/core/lock_debug.c
index 14fd8fcdcd56..8a81c5430705 100644
--- a/net/core/lock_debug.c
+++ b/net/core/lock_debug.c
@@ -65,6 +65,7 @@ int netdev_debug_event(struct notifier_block *nb, unsigned long event,
 		break;
 
 	case NETDEV_CHANGENAME:
+		netdev_assert_locked_ops(dev);
 		ASSERT_RTNL_NET(net);
 		break;
 	}
-- 
2.54.0


