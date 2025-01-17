Return-Path: <linux-leds+bounces-3809-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF78A155E6
	for <lists+linux-leds@lfdr.de>; Fri, 17 Jan 2025 18:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A97E8188D9C4
	for <lists+linux-leds@lfdr.de>; Fri, 17 Jan 2025 17:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C1CC19CCFA;
	Fri, 17 Jan 2025 17:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SCaQhVUN"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9FB1A072A;
	Fri, 17 Jan 2025 17:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737135799; cv=none; b=sB5XjiCA+Ehzty6YiY7FqC4mmJJqFSbwPk7QdQ2pWeYcRVOfpED8vsdht7HGCZIhPlqYvf59hfHjrQJqQSyN8ChOSxgNPqrSosKLBs/31F7wID0TEmfNkEL4p07Nq4vv44HqbhcaKI2oUPqaPpyaWpessvXb50vIrS0fvO/7rr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737135799; c=relaxed/simple;
	bh=RgYrYCyGQTF3zT/63opr9d/O9eS3k/Vhgcoiasoqt6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HuLvulZeaA+j+oTp8jUbDudCadyiyobTjb5ZaPTH+lhzXsiXb85PStJKk5wlEA30d0GrIGOGp97ik1syIBz2qqth3SzY9LIHR/GHos/YSJaJct3EJtXAQon+apZ+iwkEcgGqzbOHrWlQB+9NWfkC4LvfBcts0OUpQXwWDFHIK1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SCaQhVUN; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2f615e14d0fso514316a91.3;
        Fri, 17 Jan 2025 09:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737135797; x=1737740597; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RgYrYCyGQTF3zT/63opr9d/O9eS3k/Vhgcoiasoqt6I=;
        b=SCaQhVUNPKxYNHj8b8qbXRhTGo0cthkT/kiTbbgFSf8OTHRV/qQ6cIy39dIUOZKZuA
         marEYDhxGSEtcykytbdhtBYk5PH5r2cMqukSMKBgVqJ1L+f+ar2PDJjheGWvyxT+hB8G
         vSvc8mS+0l6zX8sLmvDEr+UjLVSMFu5yuTcWE8f6g1wD0N1WHk1/Y7TJsECgFPM3ZtZH
         d44JsU46akIHjV6MxHhkwG1KUI6Gs0SjHx0dXxNJ9xs7T+3M9RmCaGKuCgTVQtXSz2+2
         dZFXj2tDXpu39hHzCsYtRoucym+YJI14WV+0zxih3Hp0O9sG8CTx+eliRR1lXiHH9eX+
         1Jtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737135797; x=1737740597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RgYrYCyGQTF3zT/63opr9d/O9eS3k/Vhgcoiasoqt6I=;
        b=odsuBdN+ZZJTtxqPGZOxjZ8Gns+80MTYSh5izzdvnhpEfphyuBQqUeCFXdYHBGggvT
         7ajkhN3c3uYiJrPOgbJ69RUXjf6QKOhXz1LbLC/XK/s6/ibZ0DSHzkqEO4fxyBaNPCiZ
         cojItEBspxVxKDUTjFRo3H/71+dwXfjUwbPGn1u03kUpp5TMUWdZXooj7+qVaE9yB31k
         XioA/sKmS8487R09Vic1umBJ7KXzBQUmHEZbXxAfFvxzboRu7ACGoUiyJcEaPfb3Clwd
         u0cNPgILYHlhFzhvrAdbrCaxetc9mSEhUboxO1XicaiKpc8Lc3cfQ7HFdBCEtckpqGR9
         CZxA==
X-Forwarded-Encrypted: i=1; AJvYcCU5Ml939oU0y5wlkpJ4KnyWPS+vePn7eT5Sd1RLglAxd1D/ZNJLzpSg/uFROqCZvv5UX0be9SmANEaJ+1Y=@vger.kernel.org, AJvYcCVdnI0NAZy4yLMay11JNL/ieWb/kklrMd/aY1imPTlfdN9qdDAoRqS8SZRQrrQYAdCBlIhdRdFj6WKhG48dGu0=@vger.kernel.org, AJvYcCW5qZTviOd+p9+nx+Wlm9IOf2dwh/0lQoz3Cx3m4z7o3+8TMKZdKKInaPPfQAVlfe3TIvFqEq1FsqK+JA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIb0Xzw1oAwt+W2LMRiJbjoty2WnkV88XwcL1lvO5F8Myyvqbl
	h3vZSfn3QuTfw8KHTGPPjMTgelmR+VvZiKklulQIQ5YHh4pD7Xg7IkH1GriZF0Hp7BzS/9+FmBl
	H4gj32xaApdKiv42wg3keglDeqbg=
X-Gm-Gg: ASbGncvTsRKAbqxuWtkKL0yLt6fLTR0oW/R3+fGKYE1NDaashFvoIzdT8mFetCub0sw
	27VJbRteLF0RtGtBUzE8QxYCkE1lmzKPKcIwqeA==
X-Google-Smtp-Source: AGHT+IEoW1/mWVizhSMCoPaBk4R1JNCR6RKL2IdNmt0288LsHgm5jPgoMLrCIJvABvZNqqFS1XxlCQmk6IIj9veL69w=
X-Received: by 2002:a17:90b:2cc8:b0:2f2:f6e5:d28e with SMTP id
 98e67ed59e1d1-2f782d33a9dmr1843290a91.3.1737135796875; Fri, 17 Jan 2025
 09:43:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113121620.21598-1-me@kloenk.dev> <20250113121620.21598-6-me@kloenk.dev>
 <fe71a5b6-c544-449e-ab50-c85e1ffc0145@app.fastmail.com>
In-Reply-To: <fe71a5b6-c544-449e-ab50-c85e1ffc0145@app.fastmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 17 Jan 2025 18:43:04 +0100
X-Gm-Features: AbW1kvYC51qPfXh0z7V4THQNiMTClI4BTndlOanAbfPcuYxRu1biByDg8Y1TKCw
Message-ID: <CANiq72=5O0As_9o7cK=P3KpvHqVWOr5GsDvx1H8qo8FxOcckww@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] leds: leds_lenovo_se10: LED driver for Lenovo SE10 platform
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Fiona Behrens <me@kloenk.dev>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Peter Koch <pkoch@lenovo.com>, 
	rust-for-linux@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 17, 2025 at 6:22=E2=80=AFPM Mark Pearson <mpearson-lenovo@squeb=
b.ca> wrote:
>
> All the other files are called leds-<name>. Should this be leds-lenovo-se=
10.rs?

Rust requires underscores for the crate name, so we started with just
using the same name for both since it is simpler and to avoid ending
up with the usual mix of dashes/underscores in the future.

But we can allow them if subsystems think it is important to maintain
consistency within their folder etc.

Cheers,
Miguel

