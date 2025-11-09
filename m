Return-Path: <linux-leds+bounces-6048-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C34C43BA6
	for <lists+linux-leds@lfdr.de>; Sun, 09 Nov 2025 11:25:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74E68188965B
	for <lists+linux-leds@lfdr.de>; Sun,  9 Nov 2025 10:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E61612D63FF;
	Sun,  9 Nov 2025 10:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTAzi+ON"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701F7205E02
	for <linux-leds@vger.kernel.org>; Sun,  9 Nov 2025 10:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762683917; cv=none; b=E+7yagcd/F+LODYNqRtzSgq6MVX21nBChu1EjUHB3NYw1dwF+nPJv4IOQjJQEOknWFxl9V5VU89CGt3dCMm1DAy17mu7oDU7wf+iifvUztjckE5VUm2iRw2f7yPEfnoCu6aH/kN5gCMWzKtciEg3NmMgDOkXcNzTLqWD3tip9a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762683917; c=relaxed/simple;
	bh=aTj+xi1dNvcUs59gPpu5k/cwPtbqdjHMItUzYc4T4H8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R4xmjOYZmljaWW+tx8JZEA4Y4IEem3qxqsaBA1wUrKakNp3WUteV7lRcfIGZ/bpMPnzYW86uCArgwuXq3+CwXpU0vraDGov+jJtHMQqqSb+VB3PZBIPIC0YAWu2aLZCCOEhqZ0oZY54qqmzUZmhdtkEeY5yJesNRsBgbpvLSEhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTAzi+ON; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-297d6c0fe27so1078325ad.2
        for <linux-leds@vger.kernel.org>; Sun, 09 Nov 2025 02:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762683916; x=1763288716; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TY4/B0HvJE+qTQFqM/P/T84yDE9f54fdQMk2u26RaLo=;
        b=PTAzi+ONCWCLiiSb+RXZBrDtoEeA4zpt+ZloHAn2PXMpf/iDBkNbEi9vhSCs1l2Uwh
         27f2qwohI9FGUwSZdzuGepkmAwljd5qGp3SKmXyXdG4/kv2F0kXy6u/M/RlAFHi7Ol/I
         JNXa0nRQHPawfdoyLvnR+3dn/gm993WiyTgCDHFz1TDTRHc0BBmWZiA4xOoJwz8VKV5f
         h3kmAD5L67Bmp8GTyezcTW4Dr9sSK7Grok65NwpC6fAfTODNBvewFWFwC8yXu26nergb
         MabqGxOlAuykwGZ+wwxA88JBsPNuuTEWp7D1hMCaXgVCDDW4tBfof7U9oSve5x7ocMDb
         UcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762683916; x=1763288716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TY4/B0HvJE+qTQFqM/P/T84yDE9f54fdQMk2u26RaLo=;
        b=asvqRTRsbeVoff1OVfs0bywDJ5ZskWexH9F24vWpUJNgqiWHgcFjxozDmDQ6BiLz0n
         bCDA904b90m7GOujB1JYcZrVEIX/cxiIUgtQF/qyJ3+KMGkqXOvfP1Lvxv0rIc5B/jYz
         e+4jjiF2GghI4Sa91h6ArSA5cukSoB/i8KU1+YEcWYGODH9/ORGpbFnSJ01aZEGi5eOZ
         Gi8XcNWV1Xengj+Z375lNFvdqm17CzSHhvoIKpe38uG9VuKZBCnWOjeMIYrin7ImfQTL
         9szSijUPmZenPXInEgruVFl/yCjlkc8/ZKr3yvAeYFH57jP0pugP4v+63EUSkkU7Xmkh
         EYFg==
X-Forwarded-Encrypted: i=1; AJvYcCXlGI9B2HwkXFVhQgJdQqBOlBc8aPMBB5bXL+SYVL0Nd1S0vN6A3rp3EDn1y6s0pfo53Hs9Kl9rEaRv@vger.kernel.org
X-Gm-Message-State: AOJu0YyJeWHeOpdapQ00hWnXOlOUA6diNbbvEEa+iQXGjrg6dwWdyq9P
	/veSqFhUNWYaSsP6JkZ/nhcicJCRlnleIzI6F2sCLwAIVlQpQptDYwRawCMMbDZeOxxqigB3Olw
	+MVe5Bu6urnvovLjGEmE6uOJ0U2hDrKQ=
X-Gm-Gg: ASbGnctKl4QXlWrPTFbvf3U7yPvxucO2QjjEAFoM+4Ul39VQokU5OCOrk07hDSmBNk9
	lMldFtnm+j/lli87nXNkIYVlhzSs2YxgIJgzD4QV8nsoILGuYpCwnT7deYAL2YYm9Lch1MBZ0bn
	n6nIDVccj5wWVIdLp9QUsCXmW9bZ6TO2cL0wo6QulipEkurUzif4uLcMJGuGI05v448quBLNpKU
	HDcD78PqLJMpxPdZTxbKcNoxk17mevjZRwZlF5jj8Pq5SvFcELlfkYxJ5Ef5c1spspeSncUKc/f
	kJF+VOprW4YM2R5rj3gnxFzwBOcOmAsl1dmOjXa7bvPLR05KQiFtKLBRNI+KTHBnbhhImTCUCop
	PEo6sKiK7vMHMAA==
X-Google-Smtp-Source: AGHT+IGQaikK6vNNCjPVJeuplJDKBJe3N+BOuc4E9oBGcfkuiKRHIvOyik2Rqu1v9UYf81SQNtrIpb/0+IN8q6el/3k=
X-Received: by 2002:a17:902:d4c8:b0:297:fe30:3b94 with SMTP id
 d9443c01a7336-297fe304a7fmr17893915ad.9.1762683915716; Sun, 09 Nov 2025
 02:25:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027200547.1038967-1-markus.probst@posteo.de>
 <DDVLMBC40199.2BVFYHDGQP4Q4@kernel.org> <cf50c6db2106a900f2b9b3e11e477617d8cbb04a.camel@posteo.de>
 <CANiq72nhhji-cz2T2Cg9y5AwUwcc9q1Hd=-6J=6TafaxcHZHeA@mail.gmail.com> <d0f1effa5352959191ea8525963e84a832026dee.camel@posteo.de>
In-Reply-To: <d0f1effa5352959191ea8525963e84a832026dee.camel@posteo.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 9 Nov 2025 11:25:03 +0100
X-Gm-Features: AWmQ_blh3zXPBDBa2xOppsa0rLUtvjo_85ItJVX54L8bAP5DoouwDP0v002pXaE
Message-ID: <CANiq72mmb7oH_3bj8_EwMA8RGg6M9TjWj+ebbaEQV-RxLx1iBw@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] rust: leds: add led classdev abstractions
To: Markus Probst <markus.probst@posteo.de>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 8, 2025 at 3:49=E2=80=AFPM Markus Probst <markus.probst@posteo.=
de> wrote:
>
> Could you please clarify if there would be other responsibilities to it
> than code reviews and adapting the code to breaking changes from the
> LED Subsystem (I assume I will be notified in that event).

It depends on the case, e.g. if the LED maintainers prefer that you
manage your own tree and send PRs to them.

But, generally speaking, a kernel maintainer takes care of a few more
things, e.g. triaging bugs, fixing issues, tracking patches, deciding
which releases a patch should go into (backporting), etc. Some details
at:

    https://docs.kernel.org/maintainer/feature-and-driver-maintainers.html#=
responsibilities

This is not meant to discourage you, of course -- being a kernel
maintainer is a fairly unique experience. Now, how much it is wildly
varies depending on what code it is, e.g. how many changes go through
the C side, how many users/callers you have etc.

I hope that helps!

Cheers,
Miguel

