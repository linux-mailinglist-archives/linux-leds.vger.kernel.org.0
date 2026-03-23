Return-Path: <linux-leds+bounces-7443-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIF8CzigwWmFUAQAu9opvQ
	(envelope-from <linux-leds+bounces-7443-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 21:19:04 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B62972FD1BF
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 21:19:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C715230D7BCA
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 20:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41FF23E1CEA;
	Mon, 23 Mar 2026 20:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=szelinsky.de header.i=@szelinsky.de header.b="Df7LVueU"
X-Original-To: linux-leds@vger.kernel.org
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCD93E022B;
	Mon, 23 Mar 2026 20:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.127.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774296830; cv=none; b=gBM1TvHEWjm0z+yFCywlbTNp1acPjEwona4L4wuTc3OtpDNdNCOjRSEyeLwdEkerDdjAeNeVABaJFxRnRzDHyFZUbRBCNzQIMjr8niw2AjMLBMuqLQZAs27fvrr+JSM4CNX5c0AEFQPQE3eUYyX5ZgHfSKOMBWwShp322vWKWKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774296830; c=relaxed/simple;
	bh=5Vg7x66LmWW3+lK8EZ+thDoVhN670sDpCn7MT+dNJLo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K7wYkXCe9TyeabYzSMwhIeSEHacODgE3pu/EhFCeW2oTWbi1PfKg4DgicS/X5vT9sioyIPBjxlfWA4RS0txvBRbnX//K874+raT/hgrS5W5qoC+4MpBaxTxmZrbvFhwXWaOrDNew6WYPFhOqa5NCDI6jSRg5ONxDkZs8hLQFnco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de; spf=pass smtp.mailfrom=szelinsky.de; dkim=temperror (0-bit key) header.d=szelinsky.de header.i=@szelinsky.de header.b=Df7LVueU; arc=none smtp.client-ip=85.214.127.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id E7008E832F0;
	Mon, 23 Mar 2026 21:13:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1774296819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xKgbg91d9FAbtPKDAgsKs+zCBQvODHnqZEaYW3qcQNc=;
	b=Df7LVueUy6mjAaQtfFVrikWCc1xJau7296VCohaXQ7FzwdVt27YtPDnS2ZlGCmnDevSJ24
	jHfOrfOAlqbUCqALenbBNQv96b5tmz1u190ZJJ0yC1R0pkWstACYBnHfgmz3EtzLO/8NBc
	W1V6ec5ZXEhCsP11UfSS0vR2Htewc8mqZpppgcDIPK+VVjW5HepSDgBi2UUXQB9Ba6gzZC
	M9waJEA0iYctI2KXyQCF/Usy2XVgixN68I+wFZS2y1r60BWxXjGdmszwLN0ZavN0Xq4u2b
	CQ0LhpLFh1RYIHzuyBe2zu1tjcIKMUjfDRZZxheChhq+gMGuKVp07iWZU54hBQ==
X-Virus-Scanned: Debian amavisd-new at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
	by localhost (szelinsky.de [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id TwUFthTMUWlY; Mon, 23 Mar 2026 21:13:39 +0100 (CET)
Received: from p14sgen5.fritz.box (dslb-002-205-089-065.002.205.pools.vodafone-ip.de [2.205.89.65])
	by szelinsky.de (Postfix) with ESMTPSA;
	Mon, 23 Mar 2026 21:13:39 +0100 (CET)
From: Carlo Szelinsky <github@szelinsky.de>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	Kory Maincent <kory.maincent@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Carlo Szelinsky <github@szelinsky.de>
Subject: [PATCH v2 0/3] net: pse-pd: add poll path and LED trigger support
Date: Mon, 23 Mar 2026 21:12:22 +0100
Message-ID: <20260323201225.1836561-1-github@szelinsky.de>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7443-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[szelinsky.de:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github@szelinsky.de,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,szelinsky.de:dkim,szelinsky.de:mid]
X-Rspamd-Queue-Id: B62972FD1BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds poll-based event detection and LED trigger support
to the PSE core subsystem.

Patches 1-2 introduce the poll path independently of LED support,
so it can be tested in isolation on boards with and without IRQ
configured.

Patch 3 adds LED triggers that hook into the shared event handling
path introduced by patch 2.

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
and LED trigger state changes. Testing with IRQ configured is still
needed to verify the refactored pse_isr() path.

Link: https://lore.kernel.org/all/20260314235916.2391678-1-github@szelinsky.de/

Carlo Szelinsky (3):
  dt-bindings: net: pse-pd: add poll-interval-ms property
  net: pse-pd: add devm_pse_poll_helper()
  net: pse-pd: add LED trigger support via notification path

 .../bindings/net/pse-pd/pse-controller.yaml   |   8 +
 drivers/net/pse-pd/pse_core.c                 | 267 ++++++++++++++++--
 include/linux/pse-pd/pse.h                    |  34 +++
 3 files changed, 278 insertions(+), 31 deletions(-)

-- 
2.43.0


