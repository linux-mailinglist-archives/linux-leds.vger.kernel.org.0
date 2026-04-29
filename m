Return-Path: <linux-leds+bounces-7914-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id LkYEJw558mnjrgEAu9opvQ
	(envelope-from <linux-leds+bounces-7914-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 23:33:02 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 125D049A999
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 23:33:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E94883011A50
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 21:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4F6B3ACA61;
	Wed, 29 Apr 2026 21:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=szelinsky.de header.i=@szelinsky.de header.b="jJ63qV6s"
X-Original-To: linux-leds@vger.kernel.org
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60A92FE58C;
	Wed, 29 Apr 2026 21:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.127.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777498378; cv=none; b=TwCQP1z16NiVF+lBcFXo7OeMf/ATVGrGKaspp7g2CDZ5nSvDZvbXH56kjJn4yYkY+O5aMYGVEet3F+ZumZtRlREnOEl9s8o+Rs+kL1XlRzCakMUXXm740V3ZT+R1BOM9plthUwvteydXNu+krPbR4vccexnBt5FJrt/m0uz4w6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777498378; c=relaxed/simple;
	bh=Npd0+htLe+9yXPZp9F6EG9yvAgnKAETbR0NBN6Jn3jQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mm54MwkTV5A0d6Ua6SE4u7+GmNT2fXIQUCw6+t+qbi80ZcNiwJQG1DJSWexNFWPXWt4A8jAm3cOZ5iroMmRxfXwBUwWbqYq30R6r9B78xuAa7bB7UfaOsNjGsCKZO9x5QEjQ9hEb/X/Vhs9Wd61f1evjRIiBhl6ST9fLk5lVbkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de; spf=pass smtp.mailfrom=szelinsky.de; dkim=temperror (0-bit key) header.d=szelinsky.de header.i=@szelinsky.de header.b=jJ63qV6s; arc=none smtp.client-ip=85.214.127.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id AE579E83563;
	Wed, 29 Apr 2026 23:32:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1777498368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zVlNOCW3KnH24Ji0t/GVr8tDWyG6du2U70C/+3G4mfU=;
	b=jJ63qV6sYxtObB6jkhSIIAzk42WLwKmLbXqG3qPB4YQsXmu66RSE6JutENX3r43zJn55ft
	IpKlW5r2YsjAe8jk0rmmISS4Y2Drl6PAuNFr7RmIB5HeX5Z1wJjlGai2xoM/LCsbmrvmzf
	OYKZBnL66OclBBjYcRgF4DLizXMD9wmaVWFM7Fl5XcaYYFahduz8cFNhWrmb59Qxghe8EB
	8nbIC3l9SRQ0wsEteZdcLNwWkNsePtsKIhE8XD1W0XqA5vioqagthd3R8eXkno6uWqjr1t
	9Ohqu1vZqU+kS2TX/VFySnqhEccM1zi5U61Mwy5qftO7xytFDsEE0FXiIs2gnA==
X-Virus-Scanned: Debian amavis at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
 by localhost (szelinsky.de [127.0.0.1]) (amavis, port 10025) with ESMTP
 id etyT_gkzeYdT; Wed, 29 Apr 2026 23:32:48 +0200 (CEST)
Received: from p14sgen5.fritz.box (dslb-002-205-089-102.002.205.pools.vodafone-ip.de [2.205.89.102])
	by szelinsky.de (Postfix) with ESMTPSA;
	Wed, 29 Apr 2026 23:32:48 +0200 (CEST)
From: Carlo Szelinsky <github@szelinsky.de>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	Kory Maincent <kory.maincent@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Carlo Szelinsky <github@szelinsky.de>
Subject: [PATCH net-next v5 0/2] net: pse-pd: add poll path and LED trigger support
Date: Wed, 29 Apr 2026 23:32:22 +0200
Message-ID: <20260429213224.1747410-1-github@szelinsky.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260410124428.809943-1-github@szelinsky.de>
References: <20260410124428.809943-1-github@szelinsky.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 125D049A999
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[szelinsky.de,quarantine];
	R_DKIM_ALLOW(-0.20)[szelinsky.de:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7914-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github@szelinsky.de,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[szelinsky.de:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[]

Thanks to Kory, Oleksij, Krzysztof, Andrew and Jakub for all the
helpful feedback on earlier versions:-) I really appreciate the time
you put into reviewing this. I hope this is now the last round ;-)

This series adds poll-based event detection and LED trigger support
to the PSE core subsystem.

Patch 1 introduces the poll path independently of LED support,
so it can be tested in isolation on boards with and without IRQ
configured.

Patch 2 adds LED triggers that hook into the shared event handling
path introduced by patch 1.

Note: while reworking the poll teardown for v5, I noticed
pse_release_pis() (which kfree()s the pi[] array) runs before
disable_irq() / cancel_delayed_work_sync() in
pse_controller_unregister(). A concurrent IRQ or poll worker that
fires in that window would read through a freed pi[]. This is
pre-existing for the IRQ path (since fc0e6db30941, "Add support for
reporting events"); the v5 poll cancel inherits the same placement
for symmetry. Does it make sense that I send a separate fix that disables
both async sources before pse_release_pis() or am I wrong here?

Changes since v4:
- Rebased on top of "net: pse-pd: fix out-of-bounds bitmap access in
  pse_isr() on 32-bit" (5099807f335c, merged via net). Extended the
  same bitmap-pointer pattern to the new pse_handle_events() and
  pse_poll_worker() code paths so for_each_set_bit() does not read
  past a single unsigned long when nr_lines > BITS_PER_LONG (Jakub,
  Kory)
- Cancel the poll work explicitly in pse_controller_unregister(),
  next to the existing disable_irq() for the IRQ path, instead of
  relying on devm_add_action_or_reset() LIFO ordering. Makes the
  helper safe even when a driver registers it in the standard order
  (helper before devm_pse_controller_register()) (Jakub)
- struct pse_pi_led_triggers no longer wrapped in
  #if IS_ENABLED(CONFIG_LEDS_TRIGGERS); only the function bodies
  remain ifdef'd, so reference sites no longer need their own
  ifdefs (Jakub)
- Added .activate callbacks for both LED triggers. Without these,
  an LED bound to a trigger after pse_controller_register() (e.g.
  via sysfs) would stay dark until the next hardware event toggled
  state (Jakub)
- Run the post-registration initial-state pass under pcdev->lock,
  matching pse_led_update()'s documented locking contract and
  avoiding races with concurrent regulator_enable() that share
  last_delivering / last_enabled and the hardware ops (Jakub)
- On partial pse_led_triggers_register() failure, NULL out
  pcdev->pi_led_trigs so the existing early-return guard in
  pse_led_update() short-circuits any later calls onto
  partially-registered triggers (Jakub)

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

Link: https://lore.kernel.org/all/20260410124428.809943-1-github@szelinsky.de/
Link: https://lore.kernel.org/all/20260329153124.2823980-1-github@szelinsky.de/
Link: https://lore.kernel.org/all/20260323201225.1836561-1-github@szelinsky.de/

Carlo Szelinsky (2):
  net: pse-pd: add devm_pse_poll_helper()
  net: pse-pd: add LED trigger support via notification path

 drivers/net/pse-pd/pse_core.c | 355 +++++++++++++++++++++++++++++++---
 include/linux/pse-pd/pse.h    |  32 +++
 2 files changed, 356 insertions(+), 31 deletions(-)


base-commit: 09942ddedcb960f9e78fd817ec33f501d1040c5b
--
2.43.0


