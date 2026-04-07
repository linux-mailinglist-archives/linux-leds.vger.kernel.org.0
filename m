Return-Path: <linux-leds+bounces-7646-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eN58MeHu1GkjywcAu9opvQ
	(envelope-from <linux-leds+bounces-7646-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 07 Apr 2026 13:47:45 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A303ADE9F
	for <lists+linux-leds@lfdr.de>; Tue, 07 Apr 2026 13:47:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 37F99301FC9C
	for <lists+linux-leds@lfdr.de>; Tue,  7 Apr 2026 11:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B3223B0AD9;
	Tue,  7 Apr 2026 11:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yFQwQaC1"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2673F35F163;
	Tue,  7 Apr 2026 11:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775562324; cv=none; b=KhuIXXnwQ2/M1aySzy4LDrzStV3UDDkmzxrB5vgMC+eKQ2J6OofGCsuM5bsfADzk9OW7Nk+4PK9MBqUU3t7YsObGkyqBfKeFlZ5PGnWOov/mjqz53kowBeGvorzVPzuq/ta6TigT2gboLs4ZCHmo8RHB2h2y0/OsX0pI2+kUE2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775562324; c=relaxed/simple;
	bh=0Tlwu+/dQuwa0V7IA55JD5sXNpq/aERErDRbd3w3xww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C0nRqnNK9oJ7h2tUHQtSjGh/ZV2A1MypzZwDaPd9FeJU2Sy2ZTw8rKDZjOkWT3Lztdl14Pa0EpPxfWx83SKsXGK//Z0Tyke/RA8gIhKoKWvp4tS+HrzLhN+f3VuUwSe99o8bAZ9TeG6kthFFGJCO4uBueHcZuaYvyNF2bJdHWAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yFQwQaC1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D885C116C6;
	Tue,  7 Apr 2026 11:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775562323;
	bh=0Tlwu+/dQuwa0V7IA55JD5sXNpq/aERErDRbd3w3xww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yFQwQaC1UcUmoTkjaLFn6t5Wt66b3JuUeQM5ky9nY5LxKeaiYudAsWNo1cf5KpJuV
	 yQkeLHJDnUAi/iqENSK7YBhjZJ3ov3BsVRE5rwNk/jzywRlgXa+2RLxdhywmuQZuC/
	 LKx7rcO00hBFduXllAaY74a3i9TvaXt7tJpYaiCE=
Date: Tue, 7 Apr 2026 13:45:21 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Corvin =?iso-8859-1?Q?K=F6hne?= <corvin.koehne@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	Rob Herring <robh@kernel.org>,
	"open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Corvin =?iso-8859-1?Q?K=F6hne?= <c.koehne@beckhoff.com>,
	Ashley Towns <mail@ashleytowns.id.au>, Dan Murphy <dmurphy@ti.com>,
	Gergo Koteles <soyer@irl.hu>,
	INAGAKI Hiroshi <musashino.open@gmail.com>,
	Jacek Anaszewski <j.anaszewski@samsung.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Olliver Schinagl <oliver@schinagl.nl>, Pavel Machek <pavel@ucw.cz>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Roderick Colenbrander <roderick@gaikai.com>
Subject: Re: [PATCH] dt-binding: leds: publish common bindings under dual
 license
Message-ID: <2026040758-retool-wrecker-0301@gregkh>
References: <20260407113941.43239-1-corvin.koehne@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260407113941.43239-1-corvin.koehne@gmail.com>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7646-lists,linux-leds=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,beckhoff.com,ashleytowns.id.au,ti.com,irl.hu,gmail.com,samsung.com,linux-foundation.org,schinagl.nl,ucw.cz,milecki.pl,gaikai.com];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxfoundation.org:dkim,linuxfoundation.org:email,beckhoff.com:email,ashleytowns.id.au:email,irl.hu:email,ti.com:email]
X-Rspamd-Queue-Id: 33A303ADE9F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 01:39:41PM +0200, Corvin Köhne wrote:
> From: Corvin Köhne <c.koehne@beckhoff.com>
> 
> Changes leds/common.h DT binding header file to be published under GPLv2
> or BSD-2-Clause license terms. This change allows this common LED
> bindings header file to be used in software components as bootloaders
> and OSes that are not published under GPLv2 terms.
> 
> All contributors to leds/common.h file in copy.
> 
> Cc: Ashley Towns <mail@ashleytowns.id.au>
> Cc: Dan Murphy <dmurphy@ti.com>
> Cc: Gergo Koteles <soyer@irl.hu>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

My only change was to put the proper SPDX line on the file, so my
opinion/change does not count here for a licensing change, sorry.

thanks,

greg k-h

