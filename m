Return-Path: <linux-leds+bounces-7566-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHMaJyhGyWkZxAUAu9opvQ
	(envelope-from <linux-leds+bounces-7566-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 17:32:56 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C2B3529EB
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 17:32:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1044B3011856
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 15:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE2C7313552;
	Sun, 29 Mar 2026 15:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=szelinsky.de header.i=@szelinsky.de header.b="kVKPlvN8"
X-Original-To: linux-leds@vger.kernel.org
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AE52AD00;
	Sun, 29 Mar 2026 15:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.127.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774798326; cv=none; b=pgGsAe6GLe5bRjbxRM94ZBi3a0+m5HM3u+CPcIlyqXZTd92Hs3JbKwIeGJPyDsi30VSkIxfSKROo2G3Il18jgv6aLc2CG+F4FlNmhfNXHJWje01i44NP8AUxWy4NDM5Pf+PGA3kXhM5F8MiHPmqb964livqP4tIzbRgZYoRyO4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774798326; c=relaxed/simple;
	bh=PYE5OK7z7Jdd7yR96lM9fSnbK9gChfg3ShSKL5aGE6A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=m4MQ0tQ1cgKI57Dp0qJ1r6gilTTWjkuTBzmJ+bhX9ZFM/+hlMTJ9NHd9Y+hSFUjyg1len+MgsHHi444oqGH3Za7x08TECIZzUu5BhmgxZbEK39p3RRaYNY6bRIVt+x5Dpcby4DzhG/Vv86GFinUE0AByT1/oZ1He7iZon0AYdWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de; spf=pass smtp.mailfrom=szelinsky.de; dkim=temperror (0-bit key) header.d=szelinsky.de header.i=@szelinsky.de header.b=kVKPlvN8; arc=none smtp.client-ip=85.214.127.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id 4D56FE83AA3;
	Sun, 29 Mar 2026 17:31:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1774798316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cISj67w4spQ8WTae0MkZOWZQZ+Y8dFzeDvusrBQfhFs=;
	b=kVKPlvN8z82NJLTxn9/GUGYf0Q1aRQTxll5j/WHSrCTABRpuvuySR6MT4n3jJYWnvF0r2A
	Au8CM4ei7BNMRoFhAF3VzhtaCMNMUhljPb6oVCgxAE/c/pqE8kg2fsGbEsQ4Cy3baZTUZ3
	haRPGKfHv1SozA+WfL/x/cVd/p8JWuSzjZFe2TAm55kF5D8c42K5l3iXsQXDDCZXH6NRrL
	tZfyvRqJ/5xOPvNCz9dMPWdmRJTppKJ9epjAfGN+RDuw3AF64Bu/hR82yNQog0AL7Fxbsi
	8ob+6orzxlus5nekb/oXkGxFb/upcIKW5I39GWMfyhsGnAHHAiJFHEi0onVK3g==
X-Virus-Scanned: Debian amavisd-new at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
	by localhost (szelinsky.de [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id v9mje7p7lZZu; Sun, 29 Mar 2026 17:31:56 +0200 (CEST)
Received: from p14sgen5.fritz.box (dslb-002-205-089-102.002.205.pools.vodafone-ip.de [2.205.89.102])
	by szelinsky.de (Postfix) with ESMTPSA;
	Sun, 29 Mar 2026 17:31:55 +0200 (CEST)
From: Carlo Szelinsky <github@szelinsky.de>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	Kory Maincent <kory.maincent@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Carlo Szelinsky <github@szelinsky.de>
Subject: [PATCH net-next v3 0/3] net: pse-pd: add poll path and LED trigger support
Date: Sun, 29 Mar 2026 17:31:21 +0200
Message-ID: <20260329153124.2823980-1-github@szelinsky.de>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[szelinsky.de,quarantine];
	R_DKIM_ALLOW(-0.20)[szelinsky.de:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7566-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github@szelinsky.de,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[szelinsky.de:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,netdev,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[szelinsky.de:dkim,szelinsky.de:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 29C2B3529EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Big thanks to Kory, Oleksij and Krzysztof for all the helpful feedback
on v2 — really appreciate the time you put into reviewing this.
I learned a lot!

This series adds poll-based event detection and LED trigger support
to the PSE core subsystem.

Patches 1-2 introduce the poll path independently of LED support,
so it can be tested in isolation on boards with and without IRQ
configured.

Patch 3 adds LED triggers that hook into the shared event handling
path introduced by patch 2.

Note: pse_handle_events() and the existing pse_isr() pass notifs_mask
as a single unsigned long, which limits the bitmask to BITS_PER_LONG
PI lines. This is a pre-existing constraint in the IRQ path and is
sufficient for all current PSE controllers (max 48 ports vs 64-bit
unsigned long), but may need to be converted to DECLARE_BITMAP() if
future hardware exceeds this limit.

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

Link: https://lore.kernel.org/all/20260323201225.1836561-1-github@szelinsky.de/
Link: https://lore.kernel.org/all/20260314235916.2391678-1-github@szelinsky.de/

Carlo Szelinsky (3):
  dt-bindings: net: pse-pd: add poll-interval-ms property
  net: pse-pd: add devm_pse_poll_helper()
  net: pse-pd: add LED trigger support via notification path

 .../bindings/net/pse-pd/pse-controller.yaml   |   8 +
 drivers/net/pse-pd/pse_core.c                 | 298 ++++++++++++++++--
 include/linux/pse-pd/pse.h                    |  34 ++
 3 files changed, 309 insertions(+), 31 deletions(-)


base-commit: ced629dc8e5c51ff2b5d847adeeb1035cd655d58
-- 
2.43.0


