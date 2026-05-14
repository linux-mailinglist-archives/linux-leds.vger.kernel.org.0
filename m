Return-Path: <linux-leds+bounces-8112-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILOAFaIcBmpDewIAu9opvQ
	(envelope-from <linux-leds+bounces-8112-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 14 May 2026 21:04:02 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E32546254
	for <lists+linux-leds@lfdr.de>; Thu, 14 May 2026 21:04:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 60AAE3013A91
	for <lists+linux-leds@lfdr.de>; Thu, 14 May 2026 19:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC8239934D;
	Thu, 14 May 2026 19:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="h682e0oq"
X-Original-To: linux-leds@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C322391835
	for <linux-leds@vger.kernel.org>; Thu, 14 May 2026 19:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778785437; cv=none; b=uWzZom7MZjwxxtNRBqnw5hKD7j80iaEYzbFadBBFy6v4aOG5X+O+x7PhqvdD5K6jRjImvXilZPkb1P/aWwRfqQ5UtJX3Znb510JEy2jheM9f9DnQQj6IAtJt+2TbQkPRiQWuLOi96eIm9tiuWn1akttdIZiIxeP2wjmc6mcucSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778785437; c=relaxed/simple;
	bh=uwLE5J42WrF/Ht0WrVOwLTdb4Dt4Ytwu2XCdhXWrBcQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VrEbDNU5CIi8+rw1g+x/mXegunNMB4XSy4o94BNTCw+j1jgL3zj/EnIblNEFKxiIXw96BkUnvbW++SzTgYZ5RykqZb0cBUv0IwBWPFAJg85qMIZcsfgqz96i5I7zHjuHxPV5/hfTjpuORnLY7BrQNt/e/hd7PflohWr7pHkWKJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=h682e0oq; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from [IPv6:2a02:1812:162d:3d00:c381:7255:a866:916d] (2a02-1812-162d-3d00-c381-7255-a866-916d.ip6.access.telenet.be [IPv6:2a02:1812:162d:3d00:c381:7255:a866:916d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 18D4E77FB09;
	Thu, 14 May 2026 21:03:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1778785433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uwLE5J42WrF/Ht0WrVOwLTdb4Dt4Ytwu2XCdhXWrBcQ=;
	b=h682e0oqV01O3I4okAGVp8N1v7fdrZX5EQdrwspDkL3tTxK6D58gfVjr9QvA+KXuQ3PBm/
	qX4qHhLlwEhF0j9powiJMW4hyfh8/e5Rv3uY4uiEo+O5sM2LlrXBu1GFoVVoc+hWen/4Ns
	FaOH725htc3ix2bImEfkPuAQmFp9i4V75HEZHEpSMLu3mG7ZOOIZwlkoyib2bay6TTW/Rs
	cPluAUffD4YmdZYqz0nv/rJj1F/BTpKCcRi8dHmsy9sBFOb5jEK/TArEa54Mox31lPGUZp
	tFZavCv08TD7si0zAmimsSbiUPbNBbOrooQrJSKZ0/QK+q2SG7aILRYoBVnVlg==
Message-ID: <a8b222b3304ef00fba1342a831a5c40fb13ba467.camel@svanheule.net>
Subject: Re: [PATCH v7 2/2] leds: ltc3220: Add Support for LTC3220 18
 channel LED Driver
From: Sander Vanheule <sander@svanheule.net>
To: "Escala, Edelweise" <Edelweise.Escala@analog.com>, Lee Jones	
 <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, 
 "devicetree@vger.kernel.org"
	 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>
Date: Thu, 14 May 2026 21:03:52 +0200
In-Reply-To: <DS0PR03MB722878551FEED39276921D1DED062@DS0PR03MB7228.namprd03.prod.outlook.com>
References: <20260508-ltc3220-driver-v7-0-0f092ba54f23@analog.com>
		 <20260508-ltc3220-driver-v7-2-0f092ba54f23@analog.com>
	 <32d4a57c074c766c8ad83e4b220e44b1df9ae485.camel@svanheule.net>
	 <DS0PR03MB722878551FEED39276921D1DED062@DS0PR03MB7228.namprd03.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 56E32546254
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[svanheule.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[svanheule.net:s=mail1707];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8112-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[svanheule.net:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sander@svanheule.net,linux-leds@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[svanheule.net:mid,svanheule.net:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, 2026-05-13 at 11:25 +0000, Escala, Edelweise wrote:
> > Up to you if you want to clear the device configuration (maybe this cau=
ses
> > LED flickering?), but with REGCACHE_FLAT_S, you should be able to maint=
ain
> > the boot state of the device.
>=20
> For the reset behavior, I'm keeping the current approach (clearing all=
=20
> registers on probe) since I haven't observed any flickering, and it ensur=
es a=20
> known clean state. Let me know if you have concerns with this approach.

It's just that I've found myself forcing register writes to fix a REGCACHE_=
FLAT
cache at start-up. But if clearing everything is your preference, then I ha=
ve no
issues with that.

Best,
Sander

