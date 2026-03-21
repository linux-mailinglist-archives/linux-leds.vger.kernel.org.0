Return-Path: <linux-leds+bounces-7410-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DLJAdbbvmnZfgMAu9opvQ
	(envelope-from <linux-leds+bounces-7410-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 21 Mar 2026 18:56:38 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 971892E6A16
	for <lists+linux-leds@lfdr.de>; Sat, 21 Mar 2026 18:56:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E13F1300825F
	for <lists+linux-leds@lfdr.de>; Sat, 21 Mar 2026 17:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CED5533B6FB;
	Sat, 21 Mar 2026 17:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=szelinsky.de header.i=@szelinsky.de header.b="J0zMkjbB"
X-Original-To: linux-leds@vger.kernel.org
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC391A6814;
	Sat, 21 Mar 2026 17:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.127.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774115795; cv=none; b=uV/xIRVmJ6frb70i4k3afGW5ds9wgwqS32NSsf54fyFdWgmMxb/AugJwwD94GJWAMxqjNrTppZp2yx2rKWW/sBpzMBrevLtO91sAjzrzmkuGJLLjToZ8xlDQ+O+K+VFGy7ESVHuFeVdIHwHQYGkgSGAWOmPQUW/Pxoif4E3o7s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774115795; c=relaxed/simple;
	bh=eGd/5gQP4aOLgyBo2zFexp1yWCxsCnmks/OBoAs5zL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dyFYnAHGGNFUjqbeeNWAPfvWQrMtJpc9XtPci1Gni14+mxcbdoLTkW1uaruDpXeJD2h/q7wMIWefTjuMW6IUCsXCKSwA+99vny0a43GT2Ut3yriOCpdlQjTrl4Ze6X/tBR20tMKF5gEDTN/fV2w6u7mFxqWgVyZxJYMg19vDIRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de; spf=pass smtp.mailfrom=szelinsky.de; dkim=temperror (0-bit key) header.d=szelinsky.de header.i=@szelinsky.de header.b=J0zMkjbB; arc=none smtp.client-ip=85.214.127.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id B901AE86EBA;
	Sat, 21 Mar 2026 18:56:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1774115785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VYg/kHwNIcAR96l2jUMR6xh3BlsGVQTE1qtMPiN2MFg=;
	b=J0zMkjbBIZjAUnFqrwbK+gqMmVbsAxKAxFVcGKPUi4oRjt268QC+mFXUquCYUzJKfRPPfJ
	+D4B7gll4f0kp27GMKhWM4rEEQB3zbdXZllZJ1mDaPgiugF7r8l6ZUttPFaUjaHIj09IkZ
	wXkPYSvNupOTeLoC2plA2mE58ibakNfv5KOL6w3fpeP58eQMh77qJKHiepmjWB/32++qWp
	gaEp5PNrMo09TNFX0PjAFvujeT/gV7AhiHFlDVokgIh8IJQvoHLFy1cSfnSHEdCLqWzrIF
	ECD3vhZPOg49TFVJJLbjC5QXFEc6hz/jqxvA1r6D0j94wzF8I/dVNbpzPQIPBg==
X-Virus-Scanned: Debian amavisd-new at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
	by localhost (szelinsky.de [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id RdB47ymolZ5G; Sat, 21 Mar 2026 18:56:25 +0100 (CET)
Received: from p14sgen5.lan (p57843ab9.dip0.t-ipconnect.de [87.132.58.185])
	by szelinsky.de (Postfix) with ESMTPSA;
	Sat, 21 Mar 2026 18:56:25 +0100 (CET)
From: Carlo Szelinsky <github@szelinsky.de>
To: andrew@lunn.ch
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	github@szelinsky.de,
	kory.maincent@bootlin.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	o.rempel@pengutronix.de,
	pabeni@redhat.com,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH] net: pse-pd: add LED trigger support
Date: Sat, 21 Mar 2026 18:55:46 +0100
Message-ID: <20260321175546.282181-1-github@szelinsky.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <b42fb036-89da-48cd-9525-d05a065096d5@lunn.ch>
References: <b42fb036-89da-48cd-9525-d05a065096d5@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[szelinsky.de,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[szelinsky.de:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7410-lists,linux-leds=lfdr.de];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[github@szelinsky.de,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[szelinsky.de:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 971892E6A16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hey Kory, Hey Oleksij,

Thanks again for taking the time to give detailed feedback. I am not really experienced with working on the kernel, so I took some time to process and get a clear picture. I will try to implement and test it asap... My action points would be the following:
                                                                                                                              
1. Replace the LED specific polling with some generic devm_pse_poll_helper() that is based on the existing pse_isr() logic but in a timer instead of an IRQ - pushing events through ntf_fifo / pse_send_ntf_worker() like other IRQ-based controllers already do.
2. Fire LED triggers from the notification path, not from a separate poll loop: LEDs react to state changes e.g. they don't drive their own polling.
3. Fix pse_pw_d_is_sw_pw_control() - it currently requires pcdev->irq to be set in the PSE_BUDGET_EVAL_STRAT_DISABLED path, so poll-only controllers like hs104 would never enter software power control. Needs to also check for an active poll worker.
4. Add #define for the default poll interval (e.g. 500ms) with a comment explainin why.

Did I understand you correctly to not waste any time?

Unclear is for me still:
* Poll helper design: new devm_pse_poll_helper() vs extending devm_pse_irq_helper() with IRQ=0 fallback? I suggest a separate devm_pse_poll_helper() - it keeps the IRQ and poll paths clean and symmetric, and avoids overloading devm_pse_irq_helper() with conditional logic.
* Who decides to poll? The driver explicitly calls the poll helper, or the core auto-detects missing IRQ? I suggest the driver decides explicitly - the driver knows its hardware best, and an explicit call is easier to review and reason about than auto-detection magic.
* DT property: rename led-poll-interval-ms to poll-interval-ms since polling is now generic? I suggest yes - the polling is no longer LED-specific, so the property name should reflect that.
* Kory mentioned two distinct cases: (a) controller has no IRQ support at all (like the hs104), (b) controller supports IRQ but it's not wired on the board. Should both cases be handled by the same poll helper, or does (b) need different treatment? I suggest the same devm_pse_poll_helper() handles both - from the core's perspective the situation is identical: no IRQ available, need to poll. The driver just calls the poll helper instead of the IRQ helper in either case.

Have a nice weekend,
cheers.

