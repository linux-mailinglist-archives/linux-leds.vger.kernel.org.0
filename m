Return-Path: <linux-leds+bounces-7626-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wVGEDO/Fz2nd0QYAu9opvQ
	(envelope-from <linux-leds+bounces-7626-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Apr 2026 15:51:43 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E4852394B0A
	for <lists+linux-leds@lfdr.de>; Fri, 03 Apr 2026 15:51:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5763030217D0
	for <lists+linux-leds@lfdr.de>; Fri,  3 Apr 2026 13:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07F50330B0E;
	Fri,  3 Apr 2026 13:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=szelinsky.de header.i=@szelinsky.de header.b="IUdElz1L"
X-Original-To: linux-leds@vger.kernel.org
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4B72C21C7;
	Fri,  3 Apr 2026 13:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.127.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224299; cv=none; b=gS9Ywo6YnM6jhv0eogOe6Vecx3amG1a/0T9dqnT6EdxbqQIfWmkKjfsT1FN+HSfkqtSwDZXvB8tL5VF58cqhzJo9wBEzdia3Lr+NyS/gaIA9TxZI5iOPC+GJx6R9Ru9ZNdak24EckhV+/UUqQsiA5o0Y4cag28JePRXZ45Oy9no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224299; c=relaxed/simple;
	bh=JtU4276nFgphg9HxLMW+Dm8FtS9A1GRUkcQTJc7sB0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BHIKe11LM61i11gmBp3PPgxU3XcYy3KX2wdLGYaBDmnO06wXY9IsaGRHT4EB1QIu64CJAbdy+TlL9ElhxqPKt6TAL9JlkwYpPSiVu78EzRoxZvnWCKlXDMlVRqYVEyMaPQMXRWnJ+n10D7lzgD7q0sWwGbHJVzKSzPyLVN0ATgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de; spf=pass smtp.mailfrom=szelinsky.de; dkim=temperror (0-bit key) header.d=szelinsky.de header.i=@szelinsky.de header.b=IUdElz1L; arc=none smtp.client-ip=85.214.127.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id 22DDEE8319A;
	Fri,  3 Apr 2026 15:51:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1775224291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JtU4276nFgphg9HxLMW+Dm8FtS9A1GRUkcQTJc7sB0c=;
	b=IUdElz1LLgvkl32J24WhAZ/+TAS1sHdI8/w/yvI6/WQHYOmhe2kWIMkRhKLUvjNuFlh5Ob
	XlK1Jy2Bbl2+QuLa8xlUMXQPdy9gorNT23kpeGHIeILrDzxY/dDpe3vVQZQpppKbdhZ41q
	8zxN9hEHlDBEib8EezMcnF/TNsARtpY4SicyMOmOIqe9QJPJZlIYTIWTMhjGSm+ma96rAP
	z2F4ca5H8/tR9sS/zfuOE7EdBS4TXb5z++FnFAUt5IqdigiGgKqiNl8X/PE577eqjIdwZb
	9wNgOjXFGSlbNLPX4MPqHNA8HUU0111v5zXobcbLfsx3rMBCrkQr//mPQ6Ftxg==
X-Virus-Scanned: Debian amavisd-new at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
	by localhost (szelinsky.de [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id Xx3uqIXaZtHS; Fri,  3 Apr 2026 15:51:31 +0200 (CEST)
Received: from p14sgen5.fritz.box (dslb-002-205-089-102.002.205.pools.vodafone-ip.de [2.205.89.102])
	by szelinsky.de (Postfix) with ESMTPSA;
	Fri,  3 Apr 2026 15:51:30 +0200 (CEST)
From: Carlo Szelinsky <github@szelinsky.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Carlo Szelinsky <github@szelinsky.de>
Subject: Re: [PATCH net-next v3 1/3] dt-bindings: net: pse-pd: add poll-interval-ms property
Date: Fri,  3 Apr 2026 15:51:21 +0200
Message-ID: <20260403135121.3309161-1-github@szelinsky.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330-spiritual-placid-jackal-cd4269@quoll>
References: <20260330-spiritual-placid-jackal-cd4269@quoll>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[szelinsky.de:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7626-lists,linux-leds=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github@szelinsky.de,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[szelinsky.de:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-leds,netdev,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,szelinsky.de:dkim,szelinsky.de:mid]
X-Rspamd-Queue-Id: E4852394B0A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Krzysztof,

Thanks for the review.

The idea was to let boards tune the poll rate in case I2C bus load
matters, but you're right - that's a driver decision, not a hardware
property. The controller either has an IRQ or it doesn't, and how
often we poll is up to the driver.

I'll drop this patch and the of_property_read_u32() call in patch 2,
and just hardcode the 500ms default in the driver.

Does that work for you? Happy to send v4 with that change.

Thanks,
Carlo

