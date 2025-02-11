Return-Path: <linux-leds+bounces-3930-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDCCA3102A
	for <lists+linux-leds@lfdr.de>; Tue, 11 Feb 2025 16:50:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0D3A3A4AF8
	for <lists+linux-leds@lfdr.de>; Tue, 11 Feb 2025 15:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E819253B6B;
	Tue, 11 Feb 2025 15:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hCdMtx8/"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB36253B4F
	for <linux-leds@vger.kernel.org>; Tue, 11 Feb 2025 15:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739288995; cv=none; b=jyt3YckENbCnOy4WJuRHa4F8QyGbMMNP5dADZSjpLopwlsBVGT008OBe0R7kwiwMrSbaqXLzCTVco1JVMPn1pvUBhPab7RrIYxIEtp0vjBkPXZGqryYOuZgobk8iVqyWGyL8vkLKLKm7Al44ofGqTwpXCRbY+OTDDMk/mOhOdOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739288995; c=relaxed/simple;
	bh=tc3Z3/vbj8eaWV8ZARulWo6HcMBAleEI1od5m8b0CPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BD0qE75H+7ZPQue+X7J8okTWSv1EyNL4rIVgMFmPKEzWYMLg260hCBzA984MhjcwKl2fGQInzu55VEgLDWQxS+nVZCfXF9mrqYp44+MXIgaa24VL2nlg0SD7PD8UUb6tvP4FKv0GpaBcm4aj7wLfxHnTkrGUsls9lkr15gHB4L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=hCdMtx8/; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ab7d583d2afso260072966b.0
        for <linux-leds@vger.kernel.org>; Tue, 11 Feb 2025 07:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1739288990; x=1739893790; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BVwmbIN53ZZEzhu3yBtqTvWwAukU5JKJpM5GyqpzQFs=;
        b=hCdMtx8/JxLtYhL5jqw78sXwEhpjU4BTSuWyWbo1ZOY4VuF/TOQPk4378y+LwqNcCH
         F+xi1MoRXLrC1CFlleqwy5mEgBYtzXt3xlHKN76K5BTcnnMP8VckNLvk0eDEYtJsxHja
         7CZjjo/uFI229SCNQwaiH/NOv6sPJZxCQjzaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739288990; x=1739893790;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BVwmbIN53ZZEzhu3yBtqTvWwAukU5JKJpM5GyqpzQFs=;
        b=U3J9UaDvhdRJlnVbkt8GT91EsnabdNeL25ppbYVSUpG2BxxIisWmKEdtEG0D4+51Oy
         6wf63NhVAy1FCJ0nyPZg59aRCJrU4WD5WoJ+0IBQDkJrGID0cof3189Fk9c99GMagMxp
         biN1iLaTC3v6YKexhztW0OkQNqZmoeu5tnkcHMR6BNtPEmLn3SeBywNqCOobzzubwMvJ
         3D22GqU17fZ8+jovm+dD88lTlGtgig9bFGuT/VTBaVelgNg8eEsPHcmp03V5zLoap6Ju
         Q34l8+EumFrRIbj3akGNzKbvGjJRdsL5PS+RyjRaFQu9d6Tfi3h0p2sKVYulmbHbSYAM
         ZvEA==
X-Forwarded-Encrypted: i=1; AJvYcCXVVwkmSKhECjBd4FzHMMph2TlfALsBDivU0N8jbHfYGLqBkAOnZXe6kN5SOZwgAMdqTWQFCPVuaLub@vger.kernel.org
X-Gm-Message-State: AOJu0YxQHQVI7B9lUa7hJFJUzTeMwWPaSHCGwLGnSiAs2fePKfmNKFTV
	pjeWqN3nobT0O2gYhnycYefQCWwSkDC5bHKyx4ufpofKru/QQAc1FfC4r1sq8dTO7GisXRpIWd5
	dVk8=
X-Gm-Gg: ASbGnctCEsJH0o9UYLdLQNHyL3gy60YT7tVGc50gFeN3RSI3KVGQ4HYtqYDL1MgVA+Q
	XCh0A/zaW/5aiqUN2iT+iqjKhQOJ5XaKsneJKJOzzfacgHchmQB8LZh9+VU10NXKXtowrYnvEwV
	l5YLZrs8tOcdBMTB0J3F8EeETup6/sbi6OFMWZqi4NgcNHXpq6awVOMjFimJTd4RoTGTWvS6sd/
	Xvpd3OoK/Nii2kGjxYZk7INcEZIfy3Ht+42E7QH/YXh8Giw3Nz5C4sS1f7aHLADyA2fLYpRB1RY
	rWDgTph3n40wE1pbdswbY8msoOog5Pa0rSG3SXGsf9t/VRGdVLr5jZhzz1PiUSS/DQ==
X-Google-Smtp-Source: AGHT+IG61MmZ0/dtRQfIrKCJGndmBiYl+4ofuZ8WXvy5PTbz/Z38Rg6LVtwkVbYoLh4+eLiI3iC0gQ==
X-Received: by 2002:a17:907:c247:b0:ab6:504a:4c03 with SMTP id a640c23a62f3a-ab7daff9aefmr341859666b.24.1739288989980;
        Tue, 11 Feb 2025 07:49:49 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7878b18a9sm946574966b.167.2025.02.11.07.49.48
        for <linux-leds@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 07:49:49 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab7ca64da5dso346732666b.0
        for <linux-leds@vger.kernel.org>; Tue, 11 Feb 2025 07:49:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVV2ntcGG2ykj+op/IbAKPL8aCMCYPHYutMz0pk5/9IJ/aPXCzxI3oCzb+gpBuqXneGgubEOT9QkZO0@vger.kernel.org
X-Received: by 2002:a17:907:1c29:b0:ab7:bd8c:3501 with SMTP id
 a640c23a62f3a-ab7db35bf15mr395283466b.18.1739288988462; Tue, 11 Feb 2025
 07:49:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z6Ow+T/uSv128wdR@duo.ucw.cz> <20250211141109.GV1868108@google.com>
In-Reply-To: <20250211141109.GV1868108@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 11 Feb 2025 07:49:31 -0800
X-Gmail-Original-Message-ID: <CAHk-=whdcXj==9TkCpQYpmzLweCoDzd9_i8SrODjaQ3ysSe6dw@mail.gmail.com>
X-Gm-Features: AWEUYZka3wAIe19x0kez_tFXsKssoOVt4xO6i6B_lPdVBwJWqORTVQnRSfmH0iE
Message-ID: <CAHk-=whdcXj==9TkCpQYpmzLweCoDzd9_i8SrODjaQ3ysSe6dw@mail.gmail.com>
Subject: Re: MAINTAINERS: Move Pavel to kernel.org address
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, kernel list <linux-kernel@vger.kernel.org>, rafael@kernel.org, 
	linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Feb 2025 at 06:11, Lee Jones <lee@kernel.org> wrote:
>
> I'm struggling to apply this.

Well, it turns out I already applied it as commit 511121a48bbd
("MAINTAINERS: Move Pavel to kernel.org address"), so no worries.

        Linus

