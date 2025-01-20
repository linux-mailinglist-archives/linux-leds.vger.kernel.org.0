Return-Path: <linux-leds+bounces-3829-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE5CA16E4A
	for <lists+linux-leds@lfdr.de>; Mon, 20 Jan 2025 15:19:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F7697A20E9
	for <lists+linux-leds@lfdr.de>; Mon, 20 Jan 2025 14:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0094E1E0E0A;
	Mon, 20 Jan 2025 14:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TgBXfmuJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69171E515;
	Mon, 20 Jan 2025 14:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737382742; cv=none; b=f8UYsBCFuvyU5P0QPovz8U8CTzYVAx3XwJcTPkvzaNCzZmAjkFE6/vV4aX9EfTXBn7lOSc0+d3TEgmTrCglzL8C9FvT4Pp3iMJ/qKgOtQlGxqcBfSwYl35YxslGUXv9Rsw7uDod2r+u/vE+Gg2FIY9G3ta//3X1D2EMJEXHAXnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737382742; c=relaxed/simple;
	bh=m1L0cqHEWqwTbAH+uQ2DNRqRpDvGGNhvtaweWQxcAbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=boTpho+Krb61qolfrjbOAt+xOW6njlsUJ3IHnvjKyKFc3j5WzfuvyS6Xr8phS1kIhJyjv/5+RLZAHuuQi0vy5YbfE2Iuu5DxH32CxxeWDNPchizaZMzNYWf07RxB6lfc/tI7KlpAhYKAdEBe/n69gi2acSxW55UifeRM68HIGwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TgBXfmuJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56B99C4CEE1;
	Mon, 20 Jan 2025 14:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737382742;
	bh=m1L0cqHEWqwTbAH+uQ2DNRqRpDvGGNhvtaweWQxcAbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TgBXfmuJ6G/OGJ5GnFq14/MBAlyw05z18siJKTohb5gMOaHBHcDLhCStXWkYmMpCB
	 MUjECQea+3e3g07J6GIkh0EQReLoBD3nqpnoL+8CBfP9qkIpi4+CNZvku5M45sWsdz
	 6ECs8bfwHHwoL4cFQ0rBWPvKs4RGZWY3gUNmQllFdBhSXUe8ggShweB5WAkL4q7hk9
	 nTOTpT9Xf3LYEVZtDMjGzxBeNIMB+aBuYp3+BB2FGGNEyijTWf1wnjHHjnmAi1eF0L
	 ePABb3tmSnRS401Wr6dc7XGkgAElm/ZFuDHFKjcAybev04vuqgK83/PIAn3l/kw+JM
	 rSdeUwxOHtTKg==
Date: Mon, 20 Jan 2025 15:18:55 +0100
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Fiona Behrens <me@kloenk.dev>
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
	Lee Jones <lee@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	Peter Koch <pkoch@lenovo.com>, rust-for-linux@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] rust: leds: Add hardware trigger support for
 hardware-controlled LEDs
Message-ID: <ve4waunjbwjjuteuzsalsvbdzwygqhfla5nvqefkl5smaixups@x2e4ltcuisxd>
References: <20250113121620.21598-1-me@kloenk.dev>
 <20250113121620.21598-4-me@kloenk.dev>
 <2rla4ga3v563gdjdg6fztyh6hardmxnnclfe667gnfs4icsiqo@eho3bcv53h7d>
 <5366FB38-FF4C-4FC8-B116-9102381791D5@kloenk.dev>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5366FB38-FF4C-4FC8-B116-9102381791D5@kloenk.dev>

On Mon, Jan 20, 2025 at 11:59:03AM +0100, Fiona Behrens wrote:
> >
> > This looks as if you are doing a Rust binding for struct led_trigger.
> > But you keep calling it Hardware trigger, which makes me thing that
> > you are confused about what is a LED trigger and what is a hardware
> > trigger.
> >
> > Why do you keep putting "Hardware" into the names of these symbols?
> 
> The idea was to create a abstraction specific to writing a hardware trigger (or my understanding of what that is) and deal with the other
> trigger types later, to more separate the things on the rust side with e.g. the vtables for those.
> But my understanding might be wrong.
> 
> (My broad understanding is what I did in the SE10 driver later, to tell the hardware to not present the LED to the kernel, but some other hardware wiring to a hardware thing that then drives the LED)

Looking at patch 5, you do:

  #[vtable]
  #[cfg(CONFIG_LEDS_TRIGGERS)]
  impl triggers::HardwareOperations for LedSE10 {
      fn activate(this: &mut Self::This) -> Result {
          this.data.send_cmd(LedCommand::Trigger)
      }
  }

I think this naming "triggers::HardwareOperations" may cause confusion
in the future. I think that what you implement here should be called
LED Private Trigger, or something derived from that.

Using the work "hardware" may lead people to think that it means the
other mechanism, wherein we offload software LED triggers to hardware
(which is implemented via the `hw_control_*` members of
 `struct led_classdev`).

> 
> >
> > I fear that you may be confused about some stuff here. In order to
> > determine whether this is the case, could you answer the following
> > questions please?
> 
> That might be right, thanks for trying to clear it up if that is the case.
> 
> > - What is the purpose of `struct led_hw_trigger_type`?
> Marking a led that it has a private trigger that gives control of the LED to some hardware driver.
> > - What is the purpose of the `dummy` member of this struct? What
> >   value should be assigned to it?
> From my understanding this is just to give the struct a size, so that it has a unique address in memory so the pointer value can be compared.
> > - If a LED class device (LED cdev) has the `trigger_type` member set
> >   to NULL, which LED triggers will be listed in the sysfs `trigger`
> >   file for this LED cdev? And which triggers will be listed if the
> >   `trigger_type` member is not NULL?
> For null all generic triggers will be listed, and for some value all generic plus the specific trigger.
> > - Why does both `struct led_classdev` and `struct led_trigger` have
> >   the `trigger_type` member?
> led_classdev has it to declare that it does have a led private trigger mode, and the led_trigger has it so the activate/deactive functions can be found.
> 
> My research so far into how triggers work was mostly so that I can use the wwan module trigger on the SE10 board I have here, and therefore I did not look into how to write a generic led trigger usable on more then a specific led.
> 
> Thanks a lot for clearing up possible misunderstandings,
> Fiona

OK it seems that you do indeed understand these.

