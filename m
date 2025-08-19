Return-Path: <linux-leds+bounces-5249-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FF5B2C9CB
	for <lists+linux-leds@lfdr.de>; Tue, 19 Aug 2025 18:34:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE046A02D79
	for <lists+linux-leds@lfdr.de>; Tue, 19 Aug 2025 16:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 650FA2580F3;
	Tue, 19 Aug 2025 16:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/AHUDJ7"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63DE2566E2;
	Tue, 19 Aug 2025 16:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755620995; cv=none; b=D4P/VTb/ddyBQVszvLINm6TExK43cA4o24jH3lqyeVAa6PQChWmgwHyqPUtzndqTvSYWL8vtcnpsE1iqPPYHBe0az6fMiCa74ZIKFk0z8icIlBsQyXWpyhpNXmJ90bQJjxyJiO7dorGdZsr6iUKT06HUl3ySDOnviSt6Jdqzf0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755620995; c=relaxed/simple;
	bh=LEh5+EL4Nzc6sLyJ3DdS8xRDmSSNUY1AsJkhlelX8cQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H4SRqoTSLKhleV+eQDK/zv2/wOM7c2UcfG2doPX7nZYSFT+jBqSCaXyaNqJNKWgP66V8HeRvD2BP3IaAFekkSkrBqvuRN/Eq06/hxDYgq9fo3vgo94nN9zbSOyfZXfBbhpLzhNDXfRlN25R4C1eckMttskCPE9zkYhze/BozStE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B/AHUDJ7; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-244581d9866so45465285ad.2;
        Tue, 19 Aug 2025 09:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755620993; x=1756225793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FqqImRksTG1fesPJZdycheMXzhTsoEqoZjDJ0rDf6ZE=;
        b=B/AHUDJ72oERfvIIhzLNgPTzCHA24Hp9yBhyDPUJaXR15w15qPxtBxlEp1ziVdDpCj
         WJ8ab74Taiwt8sscfp8JxENyNtbDCUqB1k6/vxMwzaJVryAWezrpbClqSus1kmamXpkK
         PdHds/A9x8M182xlujuLekusMAZzUSnLKkGcwGoLxLfSNB2SFe7lRP8ak0h9dw3NXj5A
         uyeNsEL9LZK3z0oryQ02DHV7uclmo+jPuYijqfqOsiSq8OwloyXM5JGWPFXGlIB7Cmxt
         xuhjrocFTyE4jj8Er0/+/xBNrhmKD+AIUsjA+lb1klAgwzuVYyno5AxeJhhnpyFhx2fU
         RCyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755620993; x=1756225793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FqqImRksTG1fesPJZdycheMXzhTsoEqoZjDJ0rDf6ZE=;
        b=n60P55gPJELH0MpYgIpRZfyvyYiZVTyfgNs0yVXJYwgNcX6xmQEydeQGyieuc7uDo9
         qSTg2nNJOsVov4hD+CGWxGbwmv75apjvUk2BuiR0TDGG0skBXLs/xVEY6Q13sYwRluBh
         y66ZvlXpXkhCZ7G5dzsCFtb/d60jGUS/Ttp//hsBFyF8qvtxIkfWAhqLA6BSE+FhQyiv
         d5PkVlCqHzCjL0jVx4TDtxUzP5uc3E6dUhf+FC2tuZsKGQMcueVujAvO2kO32JGXaZYm
         SeR81ROASc4XQ+r4i7mnIWN0wPduSjl6F/vzG6euKTi9NJZmlHvnWhHcRAqhoI8DMzQH
         E0ag==
X-Forwarded-Encrypted: i=1; AJvYcCUT63QbGSpLtYFyntkyHDP3b1NR8mt888+DwR5MvRuig5YGq/UtNgxmBUd5F1JNA92HnMWZ3h02vaiIliaj@vger.kernel.org, AJvYcCUgTmX0JZ4pUA2qyWn4MoIObwoA/4bO1M9WFswcDPRxj26+vtriXQ+1pDX0NGAtORfZ5FU7hHobGKpN@vger.kernel.org, AJvYcCVUQrUfEpL/mscCpNGnIas9IHybjri3JSBqsvotQAej7iYl5oxTy1Tsvz3rJ2yDVyySTZWidX6IUdEt@vger.kernel.org, AJvYcCVW2kX4sgLNzRxTdugmVF6b0kkAggW8xWWtuaPzgd0FkHIzhzpY+UVBA9EoAeVQjnoPepScEb3USVKBRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb7/vUjAIAan2KtQH70ZKG1KKx/kwGMUDb8WrPy81Uvx7Asj2g
	3loW+Q1q0aAAYpN59832UdhZPJjhjyF/S/GsNL6RVpf54joAVJPMPn/m
X-Gm-Gg: ASbGncujLqjqCiET/egM0r8Yaa6CM6h7BwWvRu5e7z0KNuEHX3Mog84gAbpspynY8CB
	ARhwjeQTPMU2k779YJIt1FalGx98oQyWw+i8/qzr5AFaGbu99UjVbTJPFKpDdPiBOXNX56KEWmF
	yFdku0DN6kqLpWQqlKcfosf/da6Z88VN2DTHirDlG/qHNfi5fnam86DYYsW4gBHbHuzacCSS7sh
	dHERwDR9q3Lg3n1OQgz9sM6rohaneNMYRJ2mhHJgObHzd/RzUM3eAlVkWvcucEwC2xczvE+rs0b
	3VVp77CTJpLsHAehIZZ+0t9fvJ6ErQpVPxi4aNlr7oqPeAOEwJEcBQS1IQmCqROYY7v7yP7X4EV
	e4OUQUQtEc4AvcP+wY7A9pJjc9NhH1B2wYZZ/G8y8Lytz
X-Google-Smtp-Source: AGHT+IEPPrOZ11ZGYWHJ95bgwYbUGRCGS2tjPJuQVjKEv08VeOHkgaomk1LRMWfyup7vOdhXaXf5Mw==
X-Received: by 2002:a17:903:98c:b0:242:9d61:2b60 with SMTP id d9443c01a7336-245e02a22edmr35767885ad.6.1755620993119;
        Tue, 19 Aug 2025 09:29:53 -0700 (PDT)
Received: from DESKTOP-P76LG1N.lan ([42.116.199.205])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed379e92sm1632755ad.65.2025.08.19.09.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 09:29:52 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: rdunlap@infradead.org
Cc: lee@kernel.org,
	pavel@kernel.org,
	gregkh@linuxfoundation.org,
	christophe.jaillet@wanadoo.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v13 RESEND 3/4] docs: ABI: Document LP5812 LED sysfs interfaces
Date: Tue, 19 Aug 2025 23:29:45 +0700
Message-Id: <20250819162945.231085-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <1075a908-23d0-4a9e-97d2-cb68d1d6b675@infradead.org>
References: <1075a908-23d0-4a9e-97d2-cb68d1d6b675@infradead.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 17 Aug 2025, Randy Dunlap wrote:

> > +What:		/sys/class/leds/led_<id>/lod_lsd
> > +Date:		July 2025
> > +KernelVersion:	6.17
> > +Contact:	Nam Tran <trannamatk@gmail.com>
> > +Description:
> > +		0 0 mean no lod and lsd fault detected, 1 1 mean lod and lsd fault detected (RO)
> 
> At first the "0 0" and "1 1" confused me (thought it was a typo),
> but I think what you are showing here is a sysfs file with 2 values, right?
> That used to be discouraged (or even nacked), although I don't know the
> current policy on that.

The lod_lsd sysfs file currently reports two values: the first value is the LOD
(LED open detection) fault status, the first value is the LOD (LED open detection)
fault status.

I followed this approach to keep the two related fault bits in a single file, but
I'm open to splitting them into separate sysfs entries if that is preferred.

Best regards,
Nam Tran

