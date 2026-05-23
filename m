Return-Path: <linux-leds+bounces-8294-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GKUMD4AEmpPtQYAu9opvQ
	(envelope-from <linux-leds+bounces-8294-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 23 May 2026 21:30:06 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DFB5C0730
	for <lists+linux-leds@lfdr.de>; Sat, 23 May 2026 21:30:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7AA833007A7E
	for <lists+linux-leds@lfdr.de>; Sat, 23 May 2026 19:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F54318ED2;
	Sat, 23 May 2026 19:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=szelinsky.de header.i=@szelinsky.de header.b="JRivGdFk"
X-Original-To: linux-leds@vger.kernel.org
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BCF2F616A;
	Sat, 23 May 2026 19:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.127.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779564601; cv=none; b=ZpxGuVVs8/+dQyW23GG/mZfOOVVh7YGYEawc4uMs+f8pM6wG2MHAVc0T2hmUOkcFe9WBJIZ2anEqANqPHGBUagJOzqhS6mgdD516dOFjADAz5LaBAJz21LNO+iI8IAOPCdZkFFL8BT+w3rSUbm8MrqmQLtypmLU8bu/P6VE2Imc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779564601; c=relaxed/simple;
	bh=fm5N/kRJPaNrBuzSYHadYSqbBDcpc/fogoG/BsvJPm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YHUgGCrbc5iRKwsW24kfjUDeVwbtDMwd5+zOMhJPA9Wqav5onquLscugmChvSA2imG7EXvIZWZMMemdXRiKbUWgaZlR6ngkTA5pEkjB/oYJbNxd5/ZTg/Rue7XcWBhdVBR2wOJNEotDeee3GAO++Ziz4b1myVFykEhZt50H+Tsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de; spf=pass smtp.mailfrom=szelinsky.de; dkim=temperror (0-bit key) header.d=szelinsky.de header.i=@szelinsky.de header.b=JRivGdFk; arc=none smtp.client-ip=85.214.127.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id 820CEE831AD;
	Sat, 23 May 2026 21:20:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1779564039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pjmk1oikieDQs11cDLyn6nA1ZMKvPIUFrcEK7xNtQv8=;
	b=JRivGdFkZe0m7gAoFwqR5BJ7cvqP3B7mMHUNy+uGxksJsAndJSv+AbRz0fumZj2MP32oIV
	u3+QN9ObrjSKfqKU3CPVhZue9AlblVYkBxEwZH0VvftTXk1SDyeDxQIe1edXjXtE3Y2ljC
	u2R91IP5mw7O8/mMYKbZ/FnAZVYhm5PNMtfjYyGxO1OGonK10YjAqiNPS3SL9vTZ4grvAu
	sbutGluYsv/Yjduk0zk6//MO5+MltxhPFWjeRxVXsAkNRc7sX7SV7GQhqx/wilOmpWBCpq
	cpeaTsgpyWeT7hErImfTeF5flUN6Zw5aAX8Z+kgTPmQNikLt+jYvnRwjy8obFg==
X-Virus-Scanned: Debian amavis at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
 by localhost (szelinsky.de [127.0.0.1]) (amavis, port 10025) with ESMTP
 id 5DKrsHRRmzz5; Sat, 23 May 2026 21:20:39 +0200 (CEST)
Received: from p14sgen5.fritz.box (p578439b8.dip0.t-ipconnect.de [87.132.57.184])
	by szelinsky.de (Postfix) with ESMTPSA;
	Sat, 23 May 2026 21:20:38 +0200 (CEST)
From: Carlo Szelinsky <github@szelinsky.de>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Carlo Szelinsky <github@szelinsky.de>
Subject: Re: [PATCH net-next v4 1/2] net: pse-pd: add devm_pse_poll_helper()
Date: Sat, 23 May 2026 21:20:27 +0200
Message-ID: <20260523192027.319105-1-github@szelinsky.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414161146.77b70d4d@kmaincent-XPS-13-7390>
References: <20260414161146.77b70d4d@kmaincent-XPS-13-7390>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[szelinsky.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[szelinsky.de:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8294-lists,linux-leds=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github@szelinsky.de,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[szelinsky.de:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	NEURAL_HAM(-0.00)[-0.959];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[szelinsky.de:mid,szelinsky.de:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B7DFB5C0730
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Kory,

Sorry for the late reply. Too many different track and I got lost.

Just to close the loop on the notifs_mask OOB:
v5 1/2 ("net: pse-pd: add devm_pse_poll_helper()", sent Apr 29)
extends your bitmap pattern from 5099807f335c to
pse_handle_events() and pse_poll_worker(). Storage moved to
notifs_mask pointers backed by devm_bitmap_zalloc, with
bitmap_zero / bitmap_empty / for_each_set_bit on real pointers.

So the new code in v5 doesn't reintroduce the OOB.

Does this make sense? 

Cheers,
Carlo

