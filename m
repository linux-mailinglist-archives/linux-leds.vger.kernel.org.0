Return-Path: <linux-leds+bounces-4505-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B791A93CB6
	for <lists+linux-leds@lfdr.de>; Fri, 18 Apr 2025 20:21:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D21316D181
	for <lists+linux-leds@lfdr.de>; Fri, 18 Apr 2025 18:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94FCD22256A;
	Fri, 18 Apr 2025 18:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OLfbLKrm"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAA613B2A4;
	Fri, 18 Apr 2025 18:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745000501; cv=none; b=PqA3CWfnUjhUxRuM63/dBrXSLqL/B3kJMVrdhyTm34pzz9JGVmiW38SVuWYJqVzH1lcoKIQEYw1FJjfPuRjRExLO4EjTx5YpcZtJMsFrkScMxeWPeV2j037aDZYi1VCYYiQv/BlkTLtIKUvLDmN8EHj/JjOz5QFsMv2s+cDuXsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745000501; c=relaxed/simple;
	bh=SLwvrl0gbz7th4Q1VFcfpLjOLB8MNndL48XA8sfo608=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mPe8NGGcL2TRSMF5OUerk6Ye+mpqgn4l6PjdSEPms4e4TgwD5P5vOCq/0JpwzUU+U51KMbt0Y/jf7mGjxV+feVPRA/6IAyVzMTh79yXSIOCdU43eee6AbBEzY/uGabbFkMykrcVGRxSBthCZCpkadSmvRlIThYav6JpJHqI+jvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OLfbLKrm; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736ad42dfd6so1853046b3a.3;
        Fri, 18 Apr 2025 11:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745000499; x=1745605299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kS9LLNgYY9RzFfrzH68SeW5jhMvExMO5jq7yXv/Swg=;
        b=OLfbLKrm4dqnCjSkkrpqFXnrFftrPptn3tW0dws+N/erRbdjPRLDGdGNwr7C620lFU
         tkUVAekBm69m1qNKWlUSdshEVxi1e0oMButiBzV065seJQnReXmq0bOXNfkg/n8IKgrl
         tN4F12V8GMe/bxsbHUOd184bm1H8PDmSx5+gSCH1I1OJOGuLsiNNGJaWIQcbErJKzoX/
         TxBPNWq3iazEfpJyKpkAZoyi7OzIzGKp2S/OZ1vAru9RVDXEu0rqKMKW5awSBbmKv+PL
         ivDiN4TGczfgG2aMJQoJsnPLXE2BDjH5mGrybFY6ZOP7T5yBNVhmfMhHgYqMLo+tGyeq
         SRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745000499; x=1745605299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8kS9LLNgYY9RzFfrzH68SeW5jhMvExMO5jq7yXv/Swg=;
        b=s02/0Qv8fvnnrKMl4Zg2fQoThfV3AlWRG2kzY4Ozjw0qg0ZEqD+ytkbLf9akmM3tdp
         sLs+zeI8SWhK25Z0YplPlb5gPRYJbl0X+M4BGJlXOSrujbECn07dbaZUJbxaU92+MyV5
         1FPohPktQuYp/vbL3G2VZVse4DJ2a7J+Y7HrLeZM6SSgcBzWrkCcqvNzZCWaRYd5aL9r
         y0vL9e24U2txo9uApOkI1UINQe2XO0SYxdnJrORHiE/zeZXv0y6bXXMz6Jv6xAoiJRtj
         ezyR/foCRF8fJKAoc1GE4ibNzJd8Vw4N7Kw5hpkBufMJvI3UlFt84txyFWao/MmPcMAG
         6OEw==
X-Forwarded-Encrypted: i=1; AJvYcCUrqpHsO6sC7bdRYbDd3ihinTRskl6+pgyITi+7n85DoFefNtHTTp7uxRjI6eXtLv29fG93x6XzhHvzkh0=@vger.kernel.org, AJvYcCVIZfGjst3zGQR2O7DF0WY2VmRxGDtFm4ezBUKSSvMslOsYUu4cbZFUBEhvAkruikNLI53o0ZnAQI3LYLTK@vger.kernel.org, AJvYcCVgoYLHLrXCJG8HnxoIx5KrkTrfDRe9BIzHeeQ0UO5Qae5jtjn36cgNWiGIdht9CLR/+WydMsERcIFc@vger.kernel.org, AJvYcCX3bIKyAGB9+0fbOx3X+Y93dmqKWqKQNYlMkpqXolyb71Lu0hC/8V9hNH3vUPi7Y8kuR6jTzo6H22iD9g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+J+kvKS6PiYJSF++vsbRV1R38t35cvJjgBcMZ+Y2vEiLzKmDI
	VQBX0COGKEvn6gAqXg5g7p6iBfI9l1glk5hWF5voB0B04VAZN95D
X-Gm-Gg: ASbGncv5TlO5ShurZs1LvYVhOXy+Za4hKQO9XB0khg12Mf3616LygdZULFpIYJApIkX
	63rKomndO3ud/70oNPPup++rcTdOXbGDHhTziAajlZrOZXGM7SuJVviDqnhjLVQ55DHVnl5lwKR
	iSUcTViXGP8TFUdVu2Jd1ahpCzjHHcMmWTWLbCZ4qRLLHyGRNEg4ZMalvmCoPhaJ4oixebB8epP
	aIhBxoGDDVLNT07yPk62Ll3iQlew5VytdztVlXItW0X/Dx1TfNCAskryHcwfgLHf8YkzY2a2PJ+
	xrrRlPV1CCvnWRB1EKVn+jHqQwcFqO7BhlLhTz8=
X-Google-Smtp-Source: AGHT+IFRC9j6wJeAYD2mwF+2keu5K1ZF/SaRY/zWPxP4EBLUKFqAOPsnj41Veel0R8nXbo7wP6uWWw==
X-Received: by 2002:a05:6a20:158f:b0:1f0:e706:1370 with SMTP id adf61e73a8af0-203cbd59cb0mr6805648637.35.1745000499288;
        Fri, 18 Apr 2025 11:21:39 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db13a3e63sm1684024a12.29.2025.04.18.11.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 11:21:38 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: daniel@riscstar.com
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
Date: Sat, 19 Apr 2025 02:19:09 +0800
Message-ID: <20250418181927.208018-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <Z_P9AEGq2sBYShgv@aspen.lan>
References: <Z_P9AEGq2sBYShgv@aspen.lan>
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

