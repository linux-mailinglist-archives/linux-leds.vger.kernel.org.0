Return-Path: <linux-leds+bounces-3532-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C90BF9E8F20
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2024 10:49:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88A62282C23
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2024 09:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10CBE216380;
	Mon,  9 Dec 2024 09:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rhH4UrUL"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97A283CD2;
	Mon,  9 Dec 2024 09:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733737740; cv=none; b=lDtO0Uuq9Qn93LaRAhNDqJ/p3RiNumvI2JAOHyaKoayXGkL6dHYpYIz6MUrg5G4TfmpLGxlN5p8MXXVuJMdql0qGr8udom3DxGvzZTklmxGua9HZzA7p2Cri+BBAzz96hGlhKYJ9A93GTRhWcMqvhufZEgLppUnCtr4mUXysvlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733737740; c=relaxed/simple;
	bh=U0CufWdAaA6Me8Q0Og61NZHfw77qNzDNc3cWfEPpdZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IBz5FtW4op3T8n4bc2UfOJN7Bv/9waufIK8oh7FNKcvH8lrS3BvBimEO/Pmha8yWku7kaVhmOjUL0xUIGlaxfimhU2UcGs+BX2tRszWK9a6GcHfT6jUUgKpvt9k7dVAK86m0NpztjtyAGrwZy+sC/xCztAaCp4100wl79XMpYp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rhH4UrUL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 346A9C4CED1;
	Mon,  9 Dec 2024 09:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733737739;
	bh=U0CufWdAaA6Me8Q0Og61NZHfw77qNzDNc3cWfEPpdZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rhH4UrULssmgCqsspl3KJzRUsXeB8VE3f/jZTl9Clb9CSlLpM4aCumCH0Pm9KNSOy
	 AZGNhXgOvL1tMbpmSteqJV7ISBUOCJFgqewmU4F7zpyX6gD76sMFhLvi2ca9bha5J/
	 3Yi2+oSBfOfoi0liJffY8vqo+oYdzUGBx/aTw23ndad3E3fNNl19IdVW4+X1tp96zw
	 IMl1XaO5rVYZPpi6ksioU/eoPHdVXhfhxLE93OmnnaveNtDVgjYeEEbd50WkxPqfKU
	 AgdnXIoa+Gw6W3MiJ9mYgtoNg5nigWTz6vpEpDfw5UTRdHlH5cvRzZwWrfMkEixUuz
	 8cFPkfbPC+Exw==
Date: Mon, 9 Dec 2024 10:48:53 +0100
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	arm@kernel.org, Andy Shevchenko <andy@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH leds v7 00/11] Turris Omnia LED driver changes
Message-ID: <sn4jz4tqo6cywpg3vwugl4heh5qt7e2uhmvvnu3l2cf4jj22af@azybtpl5bm63>
References: <20241111100355.6978-1-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111100355.6978-1-kabel@kernel.org>

Hello Lee,

will you be taking this series for 6.14?

Marek

