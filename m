Return-Path: <linux-leds+bounces-5954-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DAFC2538E
	for <lists+linux-leds@lfdr.de>; Fri, 31 Oct 2025 14:18:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16D8D1A28284
	for <lists+linux-leds@lfdr.de>; Fri, 31 Oct 2025 13:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD792900A8;
	Fri, 31 Oct 2025 13:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q/emK1o9"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667D7210F59
	for <linux-leds@vger.kernel.org>; Fri, 31 Oct 2025 13:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761916727; cv=none; b=kpI4MKGHSXK9L28si2AYlNaLuLljsrrSIDAn7z+I1tCM+q5TsDqt4hzEi74mMFrBnn3dJe/ok11BEUg3GDAEXGFyTGRsMAepzlW19yHkgvc1+mTnXMg43vdXtrGNoqDY2/7hR3l+CXbhVtgqkBnygVV//YkKzpfXYD3FPLJnNVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761916727; c=relaxed/simple;
	bh=hwPwg21PUNDY7bWS1a5ZPuPQ7556dJiTKUQ/Cmgyxw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KOlA7hSHg0L5QpP5Ise3DDempMekv8tOE8CFLigYLv+99x2LHGOYh75V8JMUk55uIrwyxPHLA8elmk8BZEqSwiV34q5QmmVy8X4FK9psHZzAXK195SQY7z76tHA0PAcyNicvvWDqiXCWY1XeDfezuaEWPeVP21R9pzHyMDn8Vg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q/emK1o9; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b62e55af64aso113360a12.1
        for <linux-leds@vger.kernel.org>; Fri, 31 Oct 2025 06:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761916726; x=1762521526; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hwPwg21PUNDY7bWS1a5ZPuPQ7556dJiTKUQ/Cmgyxw0=;
        b=Q/emK1o9WweUKP/TM0qnDGBni2rJZHQZAp0oWvw1UfE1vFfICbOMC7CNzNuj2OPwXf
         eDc7fXGb0fUGWFWhr+qY1PvacuFs8uAmaqVaFztMiJwKaCOO71Gew+NJKrocVJ42YwL0
         k8iAMw3VSMxt0qsULEAmRrjraycqOUHZX+k/7CjOad2SH+HH3p6rUfScc/Hsl+QALrBL
         dbcV5kFINAPQ0lk6Gz95M01d1NHyCbjZuWXvu8d6gRtjIjPqiuNXzOz+Xqw3jTKBpL+V
         pQjcPzQZl1haXGQ9SGNvC0+zUYy3jrJojqPuPZLm1RLQcCN6caBqcDwlE0RZb2RNw618
         X8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761916726; x=1762521526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hwPwg21PUNDY7bWS1a5ZPuPQ7556dJiTKUQ/Cmgyxw0=;
        b=rzJKQpYKlz9B0aJSPOFybns+o8SsWe634ghsk+ghynoh2jjgaybjoYCG8fV5xZFOUq
         p8JWN0v/B0dtHJRSlm6xn7/GLjSkPdYnuSMbRx3K4fb0Fhb+HkUgRNJUHYkIoSHzYt0+
         oUlqqKhrQ0dEvb7J7kHrsyXXriqEZNgWM7w2MVNg0Od1TwcQPD8mOvy7/zOrCjiAWzc0
         Y6+/jF9tRTUVMVbPJvD341rOfff/6yi0j7WwJAIC80VCIkuTqAlxTQrNyMofKXFvFaRW
         fRBpIsk7cRWa2lJkQFyfUQ3kAOaowM8uJIbKNWKEJYmwggB1Usm77MXKwxh3IDiA7UO4
         f8Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ4pmFy2z9l5S0S7IoJtGg5IUYOt1T1MQ2eJj7wZ4HBDnXZAbEDTe7Ds9zKdz4qvo/01MogMex+ggt@vger.kernel.org
X-Gm-Message-State: AOJu0YwDZ61h3t2kj7O0fq4y7geez+b3HlQyvba5XgzCn17cN9b5YSj0
	PH3dSBfd4rmuJmxnmTYAdnTWQEuzPsGWtJLCR/xLiraD/aPZmkqRtI9Ji0UeB5k+cQEyNx787bi
	SsDkVOTHiBOI9/skqpcQgeY/ARGw0p6E=
X-Gm-Gg: ASbGncsxQZasF/0rQ28ltTHl/B+Go3Fq7bkKuISfKGFClCVLyoErzLz9IKUM08GEsgv
	ffYDyNU0XtIsB+F22S8NM1Yqbu/sSpjIVYyAChcyt0mxx+c8bl3xebjZUHyTCPcsVtcUWNqv89o
	4JnHYyB2tRURbdPszysARgNcBmm9uY1PAVIYlZiUCdexXMdH3GTphThxX7e4WNz0y4p+O51zw0l
	dBHwY39vX8LRK6JEhDaZatQUPRvicV+3KyY88PD8jWqj9DJGmto4/BwKbnxuhLjwQGR7Fdt7jby
	xGn4ggQ8G3uJrWAFYGl6tmNak6KHdsPtpUVAPa9PxGkVZhegLHIvu0bsm58IKcKG5s741DOO2Dg
	hmEHR607W7w26sA==
X-Google-Smtp-Source: AGHT+IEJ49gwJ5mRxtZtv0b41URKbZUBJLIt2VoQe30SlwO+FAYpwSB5aWCZX5jYTBZ0NgbiTYvlaN89VXh+FK/gXxA=
X-Received: by 2002:a17:902:f684:b0:294:ec58:1d23 with SMTP id
 d9443c01a7336-2951a3a3eecmr24614175ad.3.1761916725522; Fri, 31 Oct 2025
 06:18:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027200547.1038967-1-markus.probst@posteo.de>
 <DDVLMBC40199.2BVFYHDGQP4Q4@kernel.org> <cf50c6db2106a900f2b9b3e11e477617d8cbb04a.camel@posteo.de>
In-Reply-To: <cf50c6db2106a900f2b9b3e11e477617d8cbb04a.camel@posteo.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 31 Oct 2025 14:18:33 +0100
X-Gm-Features: AWmQ_bmiIa3swbTRNRoyyzvdTz1VncSekR2-DDUNMdwP2E3BLG71zRyd1NoCFP4
Message-ID: <CANiq72nhhji-cz2T2Cg9y5AwUwcc9q1Hd=-6J=6TafaxcHZHeA@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] rust: leds: add led classdev abstractions
To: Markus Probst <markus.probst@posteo.de>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 7:09=E2=80=AFPM Markus Probst <markus.probst@posteo=
.de> wrote:
>
> No there is no MAINTAINERS entry for it, therefore it will covered by
> the "RUST" entry in the file. I have added the led maintainers and the
> "linux-leds" mailing list to every patch sent regarding the led
> bindings and none of the maintainers have commented on it so far.

The global "RUST" entry is generally meant for core abstractions and
infrastructure. The best way forward is to get the C side maintainers
involved, since they are the experts on the subsystem.

Depending on what they want to do (e.g. they may want to maintain the
Rust side themselves, or they may be looking for a co-maintainer, or
they may not want Rust code for the time being, or they may prefer to
leave this to another entry, etc.), we can see what to do.

The first version was posted, I think, earlier this month (please
correct me if I am wrong), so let's give them one kernel cycle at
least to think about it.

Of course, it also depends on what you want to do. For instance, would
you be willing to maintain this code if the maintainers want to have a
"LED SUBSYSTEM [RUST]" subentry?

Thanks!

Cheers,
Miguel

