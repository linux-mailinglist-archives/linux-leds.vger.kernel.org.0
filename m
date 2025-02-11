Return-Path: <linux-leds+bounces-3933-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D436A3133C
	for <lists+linux-leds@lfdr.de>; Tue, 11 Feb 2025 18:40:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F98E3A2855
	for <lists+linux-leds@lfdr.de>; Tue, 11 Feb 2025 17:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F08D1261571;
	Tue, 11 Feb 2025 17:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RTnXmc/s"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214CA261563
	for <linux-leds@vger.kernel.org>; Tue, 11 Feb 2025 17:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739295646; cv=none; b=ac2D+sTIfRV8rFGixvfquroRP/SQqO+GcYO7FGM0/boWo98PIXs0lwvtMwsNp2bwnyAM3JqKuizwtQCNq1jswLrfQO2HzdGk6WEy/hMpxrEr/kPTf7XyDiCh9Wo7x6BKZetzfyfOZH8YPmo1fsnqf1XO0TFEqRFcbFE4Xga3pdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739295646; c=relaxed/simple;
	bh=Gl89qtb2MUsfe/8pKuOXnBbxD2G598AXAHnqxWboVm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j8RqbqkggmvGwtueLJBA5+c9roQdjj7kBgamdG86FnnozSHboO6sF2MbUaAkyHhmkec+L+kmTOfHcs6enGF8OjlhOQgz442Jb4gpI9KKqSe7DaykhMcW/GcILKNakKc1hPXFuOXU57fG+VhVscRvxE73EAg6N6VB4JVLOZOdoEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=RTnXmc/s; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5de6ff9643fso5192143a12.3
        for <linux-leds@vger.kernel.org>; Tue, 11 Feb 2025 09:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1739295643; x=1739900443; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Sz+2zlib0S1+CTvsIUDnMSNs7707USycABHIy9UgNmQ=;
        b=RTnXmc/sJQuT+kXtsm83W6OlZBnk6AOP/avXnMdDpQ+D2wyniZB815fd+SHiss66nj
         FPUdRtM1ezM9lLC2/If1FZ0xZNdPEmsXKbA7GJdJstch0GXes6Ax8urOfctFwcISEbje
         ZgdGguHo6oyQyqJxxLqhqKQUCt5upFFsmRxx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739295643; x=1739900443;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sz+2zlib0S1+CTvsIUDnMSNs7707USycABHIy9UgNmQ=;
        b=nRfarNOHCmYhI5l4jkXjCO9DD6b/eqq5cY3aPphAN11wQVfjLS3LiGRtMVca8clnPN
         kubzNvMUaNU2j3qEJ0Z+8DmKi/wOhLXPBPCK7BnH/D8p9aoxjme1JzCzYzkPZeQElF+v
         HBO4/AoH2M8eDQXo5+23iFUMHi1pibJT1aGu2XU6+ATChjTvdt7zApPiyMxAXNp9fPCr
         RbtoXSKft/GYpA60juv0tl0ZFCkHsVQBJbmwEp5eoRlztY79DBuXc6NpjhBM54C6qVTM
         p2/Kk9G/2rRPHnUhUPhqA4oIE+TfwEN/t5WYNN9B1RtJ94Gpf0LzkDWLfmH9sApXbziR
         kkxA==
X-Forwarded-Encrypted: i=1; AJvYcCXOyQA2DepU/mzFruICKpcteoSXbwQj7x4JqH5Qy2ZQPY/cGrMI3l7ibcCqsF/MvmjxIq0PEGw3uze8@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw4rFvELTpYELcAmULdwz4TSs2d+UUaqaoTfjWDnTeA98OT5oC
	BmjzCCG1uELDQX5rv6TXhAGn0Vgb2etfCpKFB3hcqHeZvTJYVsWCxPo0k/I/LnuUA2rOvF/CfK+
	HF+U=
X-Gm-Gg: ASbGncvkF6mAG3yCg80jLx8ASy0wfXM1Nobk2UgEx7B84CLZwcenYywzlo8o4ZcFEfW
	W1YyRFfO6W3x+ugyz/FjCyDkLVNYhgHRpyAAz8Q7KPhyuS+hm59P+2EId62DC3+RpiTO8B6KP/I
	MRlzQi3qdq6/FuziKFtkAmRxZv3iFBFdyXjZ3JLWJhzmXYnlolpVx3WwVP6+oxjmypn+sFYTN7u
	IC83wwEvNiGmbC1ePpcix7qc1u1wTPhTVJOMrIntZ2ypWQiGOT+TH7tQk0/IU6MQbI2g2gcR/L2
	hpCPSzLQyhqP+AXQks6ZNBsX6MZS4gKIZl0C9pY7esLxR/4RlB4T9ifSikvxvmRKCg==
X-Google-Smtp-Source: AGHT+IFM+uuha2i/yzQskLx6Z4GDCxN7oxQO5tmFr2f570eQUnFpoU+PaVKjrLF+xrH4nkyJgmUHjA==
X-Received: by 2002:a05:6402:2807:b0:5dc:da2f:9cda with SMTP id 4fb4d7f45d1cf-5deade07f66mr45863a12.27.1739295643122;
        Tue, 11 Feb 2025 09:40:43 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf1b7b0a2sm9895927a12.22.2025.02.11.09.40.41
        for <linux-leds@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 09:40:42 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5de6ff9643fso5192073a12.3
        for <linux-leds@vger.kernel.org>; Tue, 11 Feb 2025 09:40:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUHsP+eg9rwGldOITxFizPKmsoDD2Nci7Rk4x6EhmGkM0lSXy+vfkIBBwwJcZJI65ij6zn9QrOr+xu8@vger.kernel.org
X-Received: by 2002:a05:6402:278d:b0:5de:44b1:478 with SMTP id
 4fb4d7f45d1cf-5deadd05019mr166853a12.0.1739295641520; Tue, 11 Feb 2025
 09:40:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z6Ow+T/uSv128wdR@duo.ucw.cz> <20250211141109.GV1868108@google.com>
 <CAHk-=whdcXj==9TkCpQYpmzLweCoDzd9_i8SrODjaQ3ysSe6dw@mail.gmail.com>
 <20250211155614.GY1868108@google.com> <20250211160125.GA2274105@google.com>
In-Reply-To: <20250211160125.GA2274105@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 11 Feb 2025 09:40:24 -0800
X-Gmail-Original-Message-ID: <CAHk-=whFeiixFbNx8F8rVeCC-Zdco_sFyYynAbRyJH_NAx0Ukw@mail.gmail.com>
X-Gm-Features: AWEUYZkX_fOqnnjmQb4I4Q6pfCSRa56tSaSWMI6CSJkYDffeNhXYzTzv3XAJhhs
Message-ID: <CAHk-=whFeiixFbNx8F8rVeCC-Zdco_sFyYynAbRyJH_NAx0Ukw@mail.gmail.com>
Subject: Re: MAINTAINERS: Move Pavel to kernel.org address
To: Lee Jones <lee@kernel.org>, tools@kernel.org
Cc: Pavel Machek <pavel@ucw.cz>, kernel list <linux-kernel@vger.kernel.org>, rafael@kernel.org, 
	linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Feb 2025 at 08:07, Lee Jones <lee@kernel.org> wrote:
>
> > Out of interest, how did you apply it?  b4 was playing up for me.

So I had no issues, but I don't actually use b4 to apply the patches,
only to fetch them.

>   Fetching patch(es)
>   /home/lee/bin/apply-patch.sh: line 134: /tmp/<Z6Ow+T/uSv128wdR@duo.ucw.cz>.mbox: No such file or directory
>
> Where apply-patch.sh: line 134:
>
>   b4 am -3 -slt ${PATCHES} -o - ${id} > ${MBOX}
>
> My first guess would be the stray '/' in the Message-ID.

I don't know your apply-patch.sh script, so maybe the bug is there,
and it's your MBOX thing that you create without quoting the message
ID.

But in case it's actually b4, let's just add tools@kernel.org to the
participant list.

              Linus

