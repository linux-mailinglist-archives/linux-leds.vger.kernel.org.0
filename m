Return-Path: <linux-leds+bounces-5694-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E7227BC8F3F
	for <lists+linux-leds@lfdr.de>; Thu, 09 Oct 2025 14:08:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 967ED4E6234
	for <lists+linux-leds@lfdr.de>; Thu,  9 Oct 2025 12:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 117A32DD5EB;
	Thu,  9 Oct 2025 12:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IriN6iQ8"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F352C0279;
	Thu,  9 Oct 2025 12:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760011711; cv=none; b=i5hqahTPJ18fXmDIuN40VGkqgWpHUbwt1MPC6Xd7k857T8dgHdMSmApeyFT1USfNfhelehZihRdNkELku4sCNTszzxl990qHm/L1+51TUiy72WS4AeyAJEjReLBqmM+fVQFiwCfFhJ4ib73IgzyPkZiG/iwjxmwovy/pQ0r6LAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760011711; c=relaxed/simple;
	bh=iYWXzbx8ez66kA8heLRQ8QJs3w96QVpJOS9TtjkvoUQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=VPhcX7a+f0x7CB4Zr0K85NDtO3OhxbkRhqncJHOzZaOUEKASTL+4IS1HjH2AO0NHj2iR0rP/4d8zF22A3MCti5YTPxsYUdoLg4y9m0oJ3QhkfxmIdfpQyi1ODvFoMyDLfo35t/nMdS7qTYJKq//y16t+PtSFLOUNpNcVEoW0TWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IriN6iQ8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54674C4CEE7;
	Thu,  9 Oct 2025 12:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760011710;
	bh=iYWXzbx8ez66kA8heLRQ8QJs3w96QVpJOS9TtjkvoUQ=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=IriN6iQ84HhmieUK0DFkuVAA/LEd/dIdBS3Zu3zVrizkKWDA9PujxosO4S9sttq/m
	 LlM43ya970fVq9vkIjns9CMPbLJYvVrbSVvjNsTEz0ShWm7VnIlLjWxyI1+ZSI8h51
	 EaP4ScD2LKPW0rTefggsjnauQ0kCeK8z2nlbEc5B5YY/Vm/dQuNt5BQ84V8RlMZ1lJ
	 Bm8URkhQMYrQ7CXLLQWVUpHT0B3GUaOty8FdYklFajNsMcA/yIwNLRsiqSuQ/EZGKg
	 RQKxgUDX2QzUoTmuAf8VrJ91P55Ew0RRKBqNFh+qL8bp3g4V9HljAM+5KAZx0ZUxMB
	 d2u0dcGHgyunQ==
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Oct 2025 14:08:24 +0200
Message-Id: <DDDS2V0V2NVJ.16ZKXCKUA1HUV@kernel.org>
Subject: Re: [PATCH 1/4] rust: i2c: add read and write byte data
 abstractions
Cc: "Lee Jones" <lee@kernel.org>, "Pavel Machek" <pavel@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Igor
 Korotin" <igor.korotin.linux@gmail.com>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Vlastimil Babka" <vbabka@suse.cz>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, "Uladzislau Rezki" <urezki@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, <linux-leds@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Markus Probst" <markus.probst@posteo.de>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251008181027.662616-1-markus.probst@posteo.de>
 <20251008181027.662616-2-markus.probst@posteo.de>
In-Reply-To: <20251008181027.662616-2-markus.probst@posteo.de>

On Wed Oct 8, 2025 at 8:10 PM CEST, Markus Probst wrote:
> In addition to the core abstractions, implement
>
> * `i2c::I2cClient::read_byte` - read a byte from the i2c client
> * `i2c::I2cClient::write_byte` - write a byte to the i2c client
>
> * `i2c::I2cClient::read_byte_data` - read byte data from the i2c client
> * `i2c::I2cClient::write_byte_data` - write byte data to the i2c client
>
> * `i2c::I2cClient::read_word_data` - read word data from the i2c client
> * `i2c::I2cClient::write_word_data` - write word data to the i2c client

I don't think those should be implemented to be used by drivers directly.

Instead we should generalize the Io type [1] and allow for arbitrary backen=
ds,
such that we can use the register!() macro [2] to define register types for=
 I2C
devices.

Ideally, an I2C / SMBus backend should use regmap right away.

The register!() macro is currently moved into the generic infrastructure [3=
].

[1] https://rust.docs.kernel.org/kernel/io/struct.Io.html
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/gpu/nova-core/regs/macros.rs
[3] https://lore.kernel.org/all/20251003154748.1687160-1-joelagnelf@nvidia.=
com/

