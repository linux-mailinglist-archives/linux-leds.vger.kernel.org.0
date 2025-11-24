Return-Path: <linux-leds+bounces-6295-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9FFC7F483
	for <lists+linux-leds@lfdr.de>; Mon, 24 Nov 2025 08:56:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2190A34734C
	for <lists+linux-leds@lfdr.de>; Mon, 24 Nov 2025 07:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F1D2EAB61;
	Mon, 24 Nov 2025 07:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nIQPWMa2"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C669C2D59F7;
	Mon, 24 Nov 2025 07:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763970933; cv=none; b=AplzWO9JYZqDNvb0cBmKXEz77VfftJ+QAyJMqe+Ynz3Kwu6WiSemtc9GVnrc+gfk38EryCq1oBvPaiAmn8LCIOMPBEgFSvaR/qyyEfPL3OMOB2nNW8FqSsYO3L9ZQiXrm2qWZbh5ru6lmxRzN6Da2MGeiW3B01ck+2VUA8OAle0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763970933; c=relaxed/simple;
	bh=kB/LowP9yNMFGc974goascIRQdl3tBdkrA+YDVpBzDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K3B2Gq2DrZF5w01CTjVkHtA/HFJUgSYBbYCb0xOz+H2GWGs/2ptVU6hFyf/0Sl+jvbZJNFMqG3lhj2rSWnDLLr4AfeushmO4SwTodJLNkh3gSx/DJiJQr/ewSlC/YbqCQV3bLKbBRYpytB5+yijhlIzVSOHRIXp/c/YI9lCygkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nIQPWMa2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BACB6C4CEF1;
	Mon, 24 Nov 2025 07:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763970933;
	bh=kB/LowP9yNMFGc974goascIRQdl3tBdkrA+YDVpBzDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nIQPWMa2r4NiBc5fRHIN+HliseSSctf+9j9/S016niJUgvxYxlu8btsDMs0572eka
	 lLDl7GF1ZhyNvaCCJKusCNU1pN4VcULm/xSQlyJuECDP7jpetdIMN5MY31sw5p3lqW
	 aU71PjwA9TfS/e5gWNKJpKnsS/ABV+t5kPs6Y97+e4mlneSug0q+kMKhF0ZLdoIsJK
	 kIjncN0XSAifuuYrun5JS+4UHxoipaF+Ic6PNCe8Vy4z4yPysDuqjEcvlN4jop4ENF
	 nykyk/sA3uQLnb+ydMSQo1PP3QZsWJif4E/uTXB5JYqZWGooYceUTeya/3hUEqPTI4
	 hEWFXCVypVwFA==
Date: Mon, 24 Nov 2025 08:55:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nam Tran <trannamatk@gmail.com>
Cc: lee@kernel.org, pavel@kernel.org, gregkh@linuxfoundation.org, 
	rdunlap@infradead.org, christophe.jaillet@wanadoo.fr, krzk+dt@kernel.org, 
	robh@kernel.org, conor+dt@kernel.org, corbet@lwn.net, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v18 1/3] dt-bindings: leds: add TI/National Semiconductor
 LP5812 LED Driver
Message-ID: <20251124-classy-lynx-of-perception-c1ef60@kuoka>
References: <20251123191042.116917-1-trannamatk@gmail.com>
 <20251123191042.116917-2-trannamatk@gmail.com>
 <20251124-imperial-manul-of-dignity-6ab5ad@kuoka>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251124-imperial-manul-of-dignity-6ab5ad@kuoka>

On Mon, Nov 24, 2025 at 08:30:38AM +0100, Krzysztof Kozlowski wrote:
> On Mon, Nov 24, 2025 at 02:10:40AM +0700, Nam Tran wrote:
> > The LP5812 is a 4x3 RGB LED driver with an autonomous animation
> > engine and time-cross-multiplexing (TCM) support for up to 12 LEDs
> > or 4 RGB LEDs. It supports both analog (256 levels) and PWM (8-bit)
> > dimming, including exponential PWM for smooth brightness control.
> > 
> > Signed-off-by: Nam Tran <trannamatk@gmail.com>
> 
> You received review from me - where did you explain reasons of dropping
> it?
> 
> You then received SECOND review from Rob and where did you explain
> reasons of ignoring/dropping it?
> 
> You will not get third review, please start respecting our work. Read
> carefully submitting patches document.

I gave it second read and found it, although I admit it is not obvious.

I really do not expect changes to the binding at v15, then again at v17.

Best regards,
Krzysztof


