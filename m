Return-Path: <linux-leds+bounces-7448-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCuBLWGjwWknUQQAu9opvQ
	(envelope-from <linux-leds+bounces-7448-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 21:32:33 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 346842FD4DD
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 21:32:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AE78A30405D5
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 20:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81DB93DEFF7;
	Mon, 23 Mar 2026 20:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=szelinsky.de header.i=@szelinsky.de header.b="DGYSBHbs"
X-Original-To: linux-leds@vger.kernel.org
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEBE3DF00B;
	Mon, 23 Mar 2026 20:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.127.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774297648; cv=none; b=uuHBWimsSUJcwKvEyeHk1edCaWB+reF1LEGESoQ/lFoaKlmVmVexUP8AsI6mUCoQFjO4maq567IX3SPHxCaqgnWUJjRrvOkUTVspCWU0dhUGmV9fWtOtO5JqX5gaDuHNEUOtvnjBVhK/QMkZi0a9m5eoHyicAoB8/b9hHrfwEPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774297648; c=relaxed/simple;
	bh=Bpu8tfa5QrjqNo7ycF6+GNwZT8AgHMsgmCwLXSmILSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i/M2LN0aOufHvGcWiebNioiq3v0Ip6bNFsDL2KpUsAIh55gsCswzSRxvxhccMrDaxVIPoDjWrkhVOhS80/RdF46QdT9GMzmGSmVCgza1X09eQl6Y/ygPehre5Gm4rGXjmdT9agvEy059ajO3/oFEmVBwysfIxHvZiq4E3yPELDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de; spf=pass smtp.mailfrom=szelinsky.de; dkim=temperror (0-bit key) header.d=szelinsky.de header.i=@szelinsky.de header.b=DGYSBHbs; arc=none smtp.client-ip=85.214.127.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id 8B141E833B2;
	Mon, 23 Mar 2026 21:27:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1774297644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bpu8tfa5QrjqNo7ycF6+GNwZT8AgHMsgmCwLXSmILSU=;
	b=DGYSBHbs+Z0z0x6B4Qe20hqMNnI0eUlN/pNURlbZaEQVNuXhxUi4DvERHBQ2NtiEMmwLYs
	L7RRLVuiXYSxBiSvnOBjBQcbAkyiiS9NMS7UU2jYOw6QTC8ilLnxD8pFH2EL7x0Uw9S24m
	oOdA/527+PfAghSLpy/gUwSwmwPjNbEa/ZveL6LQufcQNFAWQf5MipaFSvKYSzUJA3kekv
	cFDYtYD7GZocpbZ0Li1tF9mhjWUie3BoXR4NZLg8Tyr+jpF+U+UDp7vylsOIwoi5v0Ahtg
	NxStjn+a1/ykAJVXEK4lbyAEDRfqSSzbE/yN3/Pu/8II5/4o+b0FpTWwn8OQkw==
X-Virus-Scanned: Debian amavisd-new at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
	by localhost (szelinsky.de [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id B98gUIG1gQ3o; Mon, 23 Mar 2026 21:27:24 +0100 (CET)
Received: from p14sgen5.fritz.box (dslb-002-205-089-065.002.205.pools.vodafone-ip.de [2.205.89.65])
	by szelinsky.de (Postfix) with ESMTPSA;
	Mon, 23 Mar 2026 21:27:24 +0100 (CET)
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
Date: Mon, 23 Mar 2026 21:27:19 +0100
Message-ID: <20260323202719.1839159-1-github@szelinsky.de>
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
	R_DKIM_ALLOW(-0.20)[szelinsky.de:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-7448-lists,linux-leds=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github@szelinsky.de,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[szelinsky.de:+];
	SINGLE_SHORT_PART(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[szelinsky.de:dkim,szelinsky.de:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 346842FD4DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for the support Kory, Oleksij and Andrew.

