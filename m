Return-Path: <linux-leds+bounces-3360-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 911AE9C1E39
	for <lists+linux-leds@lfdr.de>; Fri,  8 Nov 2024 14:41:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 506C228237E
	for <lists+linux-leds@lfdr.de>; Fri,  8 Nov 2024 13:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD6661E885B;
	Fri,  8 Nov 2024 13:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="P41qRvLL"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.nic.cz (mail.nic.cz [217.31.204.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8F4137E;
	Fri,  8 Nov 2024 13:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.31.204.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731073298; cv=none; b=ABmYGB8Du5LR428842Rn3RErSFwWfJIRxhqMMxyhwd/zHAuFAS2R/8i6AXsj3aCHAuGdCNJ7GdDJ7nw9vj4l7bdWQ9Mvjg30C92wxxS07zrVUF56k7bgh+oZ9nr9wCHqoJZbxoASYGGSpGNw7sJMoSBvWR/KZvOVKFQSNF7QMjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731073298; c=relaxed/simple;
	bh=5vpA3Mko9N7bNZwskXZr7hvY9tRZatGTnf174+DZG6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XwjUpySeu//m/gsvfpXcHp4HWBURwxYcYdiDa7HK1w47jg4CbAr8NEOgE5/drvQ/TWkuoipreGKNqeKaO3QTm8bUsFZDNnB2v5RzZ3wwbBYZMBxPd94Er8ooAYZzV9VQa6rPna4puJejoqr7fXSNLcD2tp4TrkqU+kTxSURqOqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nic.cz; spf=pass smtp.mailfrom=nic.cz; dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b=P41qRvLL; arc=none smtp.client-ip=217.31.204.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nic.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nic.cz
Received: from solitude (unknown [172.20.6.88])
	by mail.nic.cz (Postfix) with ESMTPS id 7AD541C12A8;
	Fri,  8 Nov 2024 14:34:00 +0100 (CET)
Authentication-Results: mail.nic.cz;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
	t=1731072841; bh=5vpA3Mko9N7bNZwskXZr7hvY9tRZatGTnf174+DZG6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From:Reply-To:
	 Subject:To:Cc;
	b=P41qRvLLqv6KnddUiZK7d9VfBkmbnrY+WCf52XecBz+LgaTUt28D+K4Bp+ESAmxWy
	 lXvfemJQPbHqgwcQL6V7ddBsqe31xOCcnuBzoqU/H5lr96wgraoWkjcarZ+7yzf5ah
	 hF/j6hT1sdXGoONjMC606Hm97aaL0O1wWveGbeMg=
Date: Fri, 8 Nov 2024 14:34:00 +0100
From: Marek =?utf-8?B?QmVow7pu?= <marek.behun@nic.cz>
To: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
	linux-leds@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, arm@kernel.org, Andy Shevchenko <andy@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH leds v6 12/12] ARM: dts: turris-omnia: Add global LED
 brightness change interrupt
Message-ID: <ksioz5fsdzt5gtszwlvxedtuqj3hehciv2gcpmbxof3ekczm3b@of2lhmsrmgb2>
References: <20241108132845.31005-1-kabel@kernel.org>
 <20241108132845.31005-13-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108132845.31005-13-kabel@kernel.org>
X-Spamd-Result: default: False [-0.10 / 16.00];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	WHITELISTED_IP(0.00)[172.20.6.88];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Pre-Result: action=no action;
	module=multimap;
	Matched map: WHITELISTED_IP
X-Rspamd-Server: mail
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 7AD541C12A8

Forgot to drop this patch (Gregory already applied it on mvebu/dt).
Sorry.

Marek

