Return-Path: <linux-leds+bounces-3371-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC189C3B7E
	for <lists+linux-leds@lfdr.de>; Mon, 11 Nov 2024 10:59:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8202628355C
	for <lists+linux-leds@lfdr.de>; Mon, 11 Nov 2024 09:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3515916F858;
	Mon, 11 Nov 2024 09:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U6C6+A5G"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032C916726E;
	Mon, 11 Nov 2024 09:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731319188; cv=none; b=dTL7FL3ZYuwP6XArLysYJ20zxY+5HERmK6vQpKTdhetwK0CJ1ys/wvKRL8kSxAL6b4q5aKTzPY204M0opFB8LXQV65RIj8kcQX6ZpfvPH0MBavGRdhXcGT4/oAlYvhJMKe4APnWO2N3X/XFbfM4EWQneI8Md3yd4dsMg+xM+HcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731319188; c=relaxed/simple;
	bh=F9qoOuyyr+mmJPW+dop1MkettG/y+6zB6pVy4UIXjYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AJ8frkv6Df7WKG0m/Ksy/qGvoiOeEEWBoSB1lKf+ChVUrLepuHMix8KLffvEtkwOmCBuJOYjN3dfoL/h7cchZLnwU06lJVhPQ/NutoWIbK6JSL2SkXmY0oyffKZxSL2z0vWwwwKUmJgIf5XNucPTsXQGl4X9rcG7h+gF7q4qbTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U6C6+A5G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D1C4C4CED0;
	Mon, 11 Nov 2024 09:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731319187;
	bh=F9qoOuyyr+mmJPW+dop1MkettG/y+6zB6pVy4UIXjYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U6C6+A5GUhW2rTHadWoq7x2un5Viu40NvB37uZhls0Ui52rW1MaNgO6XaOcq0A8aY
	 2MZ31DveZZPD6WX2Kx35k3Q+VonEJFa8ssnfJPegLH+aK8wVWHJsqUFK6K8WPj1mgd
	 /uClXf5Ic+rcw2T/35W2Fk0k1exPXblZaq2X+BAXWA4AgIVqk0pI6YytTELMvhSqCh
	 GbXTIDrYE9lOqOH+9JDch0cNmHYhPXSDQxWL4lL59TEQ8QkdFKlbnl+KQ3bnW/fgBw
	 tCl2a+wv3mHn/X4H2TUwIWmnVLpioj4C5w0WXnomSTNVqe8PggFVseL24g7wEWusop
	 XKSmevLjDiZbw==
Date: Mon, 11 Nov 2024 10:59:41 +0100
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	arm@kernel.org, Andy Shevchenko <andy@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH leds v6 06/12] leds: turris-omnia: Document driver
 private structures
Message-ID: <ngsutkonewjinwkubhqcdv3lkozry3wix2iirgzd3lu6ibyje6@jygzkq3ejjw2>
References: <20241108132845.31005-1-kabel@kernel.org>
 <20241108132845.31005-7-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241108132845.31005-7-kabel@kernel.org>

On Fri, Nov 08, 2024 at 02:28:39PM +0100, Marek Behún wrote:
> +/**
> + * struct omnia_leds - driver private data structure
> + * @client:			I2C client device
> + * @lock:			mutex to protect

This should be:
  mutex to protect cached state

Sigh. Will send v7.

Marek

