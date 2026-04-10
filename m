Return-Path: <linux-leds+bounces-7677-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKXANkD02GlJkAgAu9opvQ
	(envelope-from <linux-leds+bounces-7677-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 10 Apr 2026 14:59:44 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D28E3D7CC8
	for <lists+linux-leds@lfdr.de>; Fri, 10 Apr 2026 14:59:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CB614308850B
	for <lists+linux-leds@lfdr.de>; Fri, 10 Apr 2026 12:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCAF8227BB9;
	Fri, 10 Apr 2026 12:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=szelinsky.de header.i=@szelinsky.de header.b="U43TBQDu"
X-Original-To: linux-leds@vger.kernel.org
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EDE214204;
	Fri, 10 Apr 2026 12:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.127.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775825098; cv=none; b=u52zrwV5DXQA1j1iU/+iOnsGf87mkMI7p+dUMGAYFv5Td7lE9hHdVoJt52XrLDSVZ76bwttXWfxzy6uVl80XeLuonXYe9oNFwZdEus3s0yRgC4AZ+RG6MZ8vpceLBTTc79l27zGg5KqLntLqIswx+Da4MbXbv2N11/Rvvc2/EqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775825098; c=relaxed/simple;
	bh=XiDBWQRJa/ctg0MEJDMRNboA8UI5k7R6kq+JG0FovN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fc8C4W6GbanP3LwaHtlL7YUEqF1jpEzKhRJVrDTNTu7xz3cS3hgr3mgiriKzZbVEKBV//1BUOlbMvpKnEAjiTOaC8lTCnbDUT95V97HQ9fNGz6W+6xkallvpaX4K8OFICRLH8wyM+x/dN14CusyB42VoxC4ZFM9Urtws7DemOsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de; spf=pass smtp.mailfrom=szelinsky.de; dkim=temperror (0-bit key) header.d=szelinsky.de header.i=@szelinsky.de header.b=U43TBQDu; arc=none smtp.client-ip=85.214.127.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id 7F799E839FB;
	Fri, 10 Apr 2026 14:44:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1775825088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MFiJPJf1qTa4st0wCea9VM28VD22P60iUaFJWKkrkTQ=;
	b=U43TBQDuqPg+mJ3xf2NDpiLSFgYvYeT6DtgmP/521sPbjLd9g/JTZPxhrFSzswoyq5BcCm
	w60iYMGeFbCKq1DJmk8PI5apSAy6TboYoMRZ60JZhnoOXd6S/1UgUEausSWvcv+DhrgQxt
	jPOL/cnb0KJ0Z6lgmZUA5vLCVO44kpkXhL8hLFpLtoygJRuRHDBX+cb/vMesJkx7UG2Lce
	xf9mllJELaxpZP73Lf+xI3b8WcD1vtaf3VgR0PtoYYxZZn3M30fzbyudeq/EBR0npfGEzu
	/JBNISDwNTEgB0Lbh/Ye/zBte0Kz/zhr83dzIR4GnrRmsKjEo9kC39WVeomo3g==
X-Virus-Scanned: Debian amavisd-new at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
	by localhost (szelinsky.de [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id NS8JtIVq8DwQ; Fri, 10 Apr 2026 14:44:48 +0200 (CEST)
Received: from p14sgen5.fritz.box (dslb-002-205-089-102.002.205.pools.vodafone-ip.de [2.205.89.102])
	by szelinsky.de (Postfix) with ESMTPSA;
	Fri, 10 Apr 2026 14:44:47 +0200 (CEST)
From: Carlo Szelinsky <github@szelinsky.de>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	Kory Maincent <kory.maincent@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Carlo Szelinsky <github@szelinsky.de>
Subject: [PATCH net-next v4 0/2] net: pse-pd: add poll path and LED trigger support
Date: Fri, 10 Apr 2026 14:44:26 +0200
Message-ID: <20260410124428.809943-1-github@szelinsky.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[szelinsky.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[szelinsky.de:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7677-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github@szelinsky.de,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[szelinsky.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,netdev,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[szelinsky.de:dkim,szelinsky.de:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0D28E3D7CC8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thanks to Kory, Oleksij, Krzysztof and Andrew for all the helpful
feedback on earlier versions - really appreciate the time you put
into reviewing this.

This series adds poll-based event detection and LED trigger support
to the PSE core subsystem.

Patch 1 introduces the poll path independently of LED support,
so it can be tested in isolation on boards with and without IRQ
configured.

Patch 2 adds LED triggers that hook into the shared event handling
path introduced by patch 1.

Note: pse_handle_events() and the existing pse_isr() pass notifs_mask
as a single unsigned long, which limits the bitmask to BITS_PER_LONG
PI lines. This is a pre-existing constraint in the IRQ path and is
sufficient for all current PSE controllers (max 48 ports vs 64-bit
unsigned long), but may need to be converted to DECLARE_BITMAP() if
future hardware exceeds this limit.

Changes since v3:
- Dropped the dt-bindings poll-interval-ms patch: the poll interval
  is a driver decision, not a hardware property (Krzysztof)
- Removed of_property_read_u32() for poll-interval-ms from
  devm_pse_poll_helper(); the 500ms default is now hardcoded but
  drivers can override pcdev->poll_interval_ms before calling the
  helper
- Rebased on net-next/main

Changes since v2:
- Based on net-next/main, added net-next subject prefix
- Added --base tree information
- Added CC for devicetree list and DT maintainers
- Collected Reviewed-by from Kory Maincent on patch 1/3
- Fixed build error when CONFIG_LEDS_TRIGGERS is disabled:
  moved LED registration before list_add(), removing the
  pcdev->pi_led_trigs = NULL assignment on conditionally
  compiled struct member (reported by kernel test robot)
- Fixed use-after-free on device unbind: poll work is now
  cancelled via devm_add_action_or_reset() to ensure correct
  devres teardown ordering (poll_work cancelled before
  poll_notifs is freed)
- Used system_freezable_wq for poll worker to prevent hardware
  access during system suspend
- Added PoDL power status and admin state checks to LED triggers
  so they work for both C33 and PoDL controller types
- Used dev_name(dev) for LED trigger names to ensure uniqueness
  across multiple PSE controllers (of_node->name can be generic)
- Added initial LED state query at registration so already-active
  ports are reflected immediately
- Added pse_led_update() calls in regulator enable/disable paths
  so ethtool admin state changes are reflected in LEDs
- Moved LED trigger registration before list_add() to prevent
  race where IRQ/poll could invoke pse_led_update() on partially
  initialized triggers

Changes since v1:
- Split single patch into 3 separate patches
- Extracted pse_handle_events() and devm_pse_poll_helper() as a
  standalone poll path (patches 1-2), testable without LED code
- Added DT binding for poll-interval-ms as a separate patch
- Renamed led-poll-interval-ms to poll-interval-ms for generic use
- Fire LED triggers from the notification path rather than a
  separate poll loop

Tested on Realtek RTL9303 with HS104 PoE chip, poll path only
(without IRQ configured). Verified PD connect/disconnect notifications
and LED trigger state changes.

Link: https://lore.kernel.org/all/20260329153124.2823980-1-github@szelinsky.de/
Link: https://lore.kernel.org/all/20260323201225.1836561-1-github@szelinsky.de/
Link: https://lore.kernel.org/all/20260314235916.2391678-1-github@szelinsky.de/

Carlo Szelinsky (2):
  net: pse-pd: add devm_pse_poll_helper()
  net: pse-pd: add LED trigger support via notification path

 drivers/net/pse-pd/pse_core.c | 296 ++++++++++++++++++++++++++++++----
 include/linux/pse-pd/pse.h    |  34 ++++
 2 files changed, 299 insertions(+), 31 deletions(-)


base-commit: b3e69fc3196fc421e26196e7792f17b0463edc6f
-- 
2.43.0


