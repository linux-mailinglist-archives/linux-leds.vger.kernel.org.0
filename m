Return-Path: <linux-leds+bounces-4504-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF612A93CB3
	for <lists+linux-leds@lfdr.de>; Fri, 18 Apr 2025 20:19:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EC7317157D
	for <lists+linux-leds@lfdr.de>; Fri, 18 Apr 2025 18:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8EF1222568;
	Fri, 18 Apr 2025 18:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNf3NsIB"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E08613B2A4;
	Fri, 18 Apr 2025 18:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745000377; cv=none; b=aJrfcl1TyQw79qLIp9/cmdt7PeE0S15hqyMuvQWtacUrHLCyKx0mQw2yQiYi/QNaTFOl+nby4h2ZAj8rtBKVPCnTkustjM5vxyqt6hXjZ8yHGS5WzZAo1xcTjGbcxsEtbx/UT/72i6vb5nE2wFlv7U/es2jbBUR67A1tzX18T64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745000377; c=relaxed/simple;
	bh=SLwvrl0gbz7th4Q1VFcfpLjOLB8MNndL48XA8sfo608=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pIZI9Ea4OYKgH6DqWNPDO0dZPoq/M6mt8swDWRjfuLfOBBPZ0NbtlP+RaiZw17ZalCuWanZjvE6iAW5AL7tuoHdzxaWhi2nVGrERGYBYq5DCYU3AW/9mPAvP7Arj5D+0PbzvKQxURaoHVqVYT7b4BKJhpcsk0P+2P+tmk0cjIK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jNf3NsIB; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736aa9d0f2aso2461225b3a.0;
        Fri, 18 Apr 2025 11:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745000375; x=1745605175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kS9LLNgYY9RzFfrzH68SeW5jhMvExMO5jq7yXv/Swg=;
        b=jNf3NsIBTfA5ilXLOvZ6vRgl/FkI8sEWO5B3alRQmNx2MakNP8yNYy/v8f7eTPJkte
         oAGN0UGLwO3e3UzfeNkm/5dUc9qMcwoE/jMRsIWtUSOndwHrIaFGtdWd/Mpg/Xc7fjGL
         UW1EAdrPyoqoBM/Kif7bwJp7xTehar8JocsuldDY4X4mkUB9k5Fxhwq1AZPnDyPY1bwF
         gSgyoMc9wxJAQmT52I8h7MadUP8GJgEyz0Tkrr4kcUBQ5Ijpd7CgjwBUm1ZVHHsy8pA0
         F5S+Nke6jpeGXANs5WZUBhfKdaZfLjOYxVOK3GtfeGb7chQ8uw+1UHmxYPvFWft4ZCek
         o/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745000375; x=1745605175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8kS9LLNgYY9RzFfrzH68SeW5jhMvExMO5jq7yXv/Swg=;
        b=qT7SSJWkEYbXWSRwIiJsoO0jF78O/JOJvpWuACt/8GpBUpZCRo/gbkycG06bSswTv7
         T/g42lLFOZ7Hif9U1qVdGps/1w7T3xaSNCYx6YKenAcnLcg7+tEPNdHigb6QTPBE9DC5
         5bwFB0iYC9yJ3OM0Ab1nNlkTqMazT0ncWpcop1OamlSSubmMs/4uJ1R9qcJhbi8eQMco
         7XZvjWkE/aFJE0G5V/VFEhhsgA/OUHjW7y339N9Zj94u6TrtCrfyEsGzFsgfAKRptNcw
         h3wT5QeLkYZ6W9uB7ImZXwPKJULxdVmChKxhyavdeqxQZ/GWsFiBxfU3gf2xK4ouHj6o
         Gc1w==
X-Forwarded-Encrypted: i=1; AJvYcCUQ/qcnd+0QdEXASb7dm3palLZLbFtTcs7NAH2Bs5wocvMFR85wudBdTs47wb6K/N1k2qg/lEWkoQKh@vger.kernel.org, AJvYcCUXhQ55e+HtlUJ+dPmaS+UszQ5xYEDUi24Mo2UkT+tYGGFvDokAv5TWLlElkvW5Ulm0Z7xVBM1zbzGsiQ+u@vger.kernel.org, AJvYcCUi5N07kzrnbjUPFlwuBcD1VzEX8AiKwgTQIl9VxDX/OjAAyGL7GNyUm0d7xlZfBxbEca74pz+393GyQA==@vger.kernel.org, AJvYcCUi7Yxl+rgdwDATgzJiWEiiZgFgrFxP1i2S11oei+6fyidyR8G6JcwhyXokMxFfJS7dcBaGdCSFq4Nhkpw=@vger.kernel.org
X-Gm-Message-State: AOJu0YztX0Y3dkGHHfqyAgsK3SiGs3Ok7jqVrQ9hQwporCvjzpx7FQVj
	j/WiHmExnbKX5UDoCHJeVKY+zgbuOv6Qwyt63UQr1AYqo+6ubk84
X-Gm-Gg: ASbGncsFV2ulonL2haL/a1ZSQK+uH5A8GIhQ5FaJH4WFBtygohLefCclBBH0SeSaYw6
	hQ81oLXkcsb79nj5n3Z5coYHMkR3kZPfxDgVA8HDCad9y+uVPiIDz1FAtx/RPNZcxeURgp/xxCP
	rzDd319tQF75ff8nRVdYaOBqu4zlQgItaAk+7lSTMcyFP2L9e3HLwBS80kr+dNWyfBg2sIqJ9IU
	WUeYOKqW27MdRoK/vpo7kKOGjUR96ccOaB6Xif+rMKxzJIf/TrUK6262RmdyLtxZvK1+GLUB89H
	u+0e4am34kzN9ln8PTm3EnfVWjc1BWDwBH4dkHs=
X-Google-Smtp-Source: AGHT+IEjqGe6VSPq7PwLD+gzJ3hWDVXQTREJby4Lm4NevX09+gzhJFn1k3fAtNK4eeMvdM3YN6xsuQ==
X-Received: by 2002:a05:6a00:6c85:b0:736:4e02:c543 with SMTP id d2e1a72fcca58-73dc1497eb0mr4082141b3a.9.1745000375225;
        Fri, 18 Apr 2025 11:19:35 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf90d7easm1892085b3a.84.2025.04.18.11.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 11:19:34 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: krzk@kernel.org
Cc: conor+dt@kernel.org,
	danielt@kernel.org,
	deller@gmx.de,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	jingoohan1@gmail.com,
	krzk+dt@kernel.org,
	lee@kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	lujianhua000@gmail.com,
	mitltlatltl@gmail.com,
	pavel@kernel.org,
	robh@kernel.org
Subject: Re: [PATCH 2/4] backlight: ktz8866: add slave handler
Date: Sat, 19 Apr 2025 02:17:16 +0800
Message-ID: <20250418181723.207795-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <eb23737f-5b6c-47fd-8b39-637e059bd5f1@kernel.org>
References: <eb23737f-5b6c-47fd-8b39-637e059bd5f1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Apr 8, 2025 at 12:27 AM Daniel Thompson <daniel@riscstar.com> wrote:
> On Mon, Apr 07, 2025 at 05:51:17PM +0800, Pengyu Luo wrote:
> > Kinetic ktz8866, found in many android devices, nowadays, some oem use
> > dual ktz8866 to support a larger panel and  higher brightness, original
> > driver would only handle half backlight region on these devices,
> > registering it twice is unreasonable, so adding the slave handler to
> > support it.
> 
> Is there anything unique about KTZ8866 that allows it to be used like
> this? I think it would be better to add support for secondary backlight
> controllers into the backlight framework, rather than having to
> implement driver specific hacks for every backlight controller that
> appears in a primary/secondary configuration.
> 

According to my understanding, if I add the new api to backlight framework,
with a minimal modification, then I either do A or do B(I doubt it is my
fixed mindset)

A:
Tied two devices, registering the primary and the secondary device during
one probe, to do that, I access another KTZ8866 when probing. Those hack
is still here, that doesn't seem to help.

B:
Uncoupled, probing separately, the later one is registered as the
secondary one. Brightness control is a little uncoupled, there are two
sysfs, I doubt if userspace programs will write brightness to two
devices. Then we need synchronization, write primary => write primary
and write secondary, viceversa.

> Also, the kernel seeks to avoid adding new instances of master/slave
> terminology. See the coding style doc for suggested alternatives:
> https://www.kernel.org/doc/html/latest/process/coding-style.html#naming
> 

Agree.

Best wishes,
Pengyu

