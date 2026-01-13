Return-Path: <linux-leds+bounces-6637-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AADD1915F
	for <lists+linux-leds@lfdr.de>; Tue, 13 Jan 2026 14:22:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7755C3016920
	for <lists+linux-leds@lfdr.de>; Tue, 13 Jan 2026 13:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D0E138F94B;
	Tue, 13 Jan 2026 13:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jXBBPzW5"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2366638A9D6
	for <linux-leds@vger.kernel.org>; Tue, 13 Jan 2026 13:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768310574; cv=none; b=U+D2tOKAPoHD7j3YznYxHOG5CkUmYg25BcQ2yBv6t+s0v+Bu+URaU9am/Oi6xeNFcmjoKVKwotMbXthaUt5W50b8YrSV+4C/ijMFyRNnX+YJrLjhmJxYR3azeRNygTbSUFD40bq1jLmsVWPD8S+xtdeGZZJK1x/0wPR4ti43M6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768310574; c=relaxed/simple;
	bh=9Mgbd6hLYyZUvA5ylRuwiz+22RngeE/5EJiRoxjavak=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CiD5Z/zahzn9AeYLAcv1WehlVu450toW4wht28scc9SMmhyMX6R84sa/VKHYsjv/rO43syAKfvHL6B6t4IGBS1kSbvB/k+WzW9vM4sZPewLVOanvJ3R6SKSN6N1dhi0ieSa5+BD4jZqI/oJ1fC7n6lu+NGovMmo1hYnGg7OlOpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jXBBPzW5; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29f102b013fso69849855ad.2
        for <linux-leds@vger.kernel.org>; Tue, 13 Jan 2026 05:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768310572; x=1768915372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8f9VuSjE116pi7iG6Wpon5XwC0RbZghgrAlkmtN02HE=;
        b=jXBBPzW5Yf8IPx0L5ejxvjyIki75WjK0Gq31WyosO6nnSLTLydhS+oIsMZLQD9tRtA
         b62Ga5dS3I8874W36Y/zO6nX10XV71+80pPjAqXwlN2gqav23C7TeYe7Xl07SbMz+8KZ
         uSXxUKZbEBUZ0vcyEr0jSmxcBC6jMtcABtg3YUD76UP8ff54R9A5Uh1wEFJr1zGO9xj0
         xAmxtpqA8o6bH10+NEQwD0kyTvNwKwPCAKLQSRVXhAAkhnxQOdBTFZCOA+tQ3c7iLis/
         4zhR+k12lvlkfTNE2ji5obJ4C0zrQaWXeY7/JVULM9193+KlGEEB2Q9TmgmogaJKRTfz
         6KZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768310572; x=1768915372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8f9VuSjE116pi7iG6Wpon5XwC0RbZghgrAlkmtN02HE=;
        b=tciixcf4u+clgtBI46evD0X0HGTcLVtV7moAx1F2ebx2MOK4gGKPvUgGSa51B1ZERT
         5bgmIdIwUnpW2+Y/uDpGDhvYU/y76ekMOI3jrzktYDjQbUvyDFV1bS0XwwH6ZfQ53yxL
         xBQGKu9d2zxXpz7CV91qo/2wkbDQpdHFcI97B64ih8OpVFZaqAMssr06Lkvi9kUPGel+
         hHtOeTSSIMV85dZli9l1CbBOYueStcL2ZYrfeKzZXGlbBrvO1MTx1vbVhZs2CnYERs/9
         ZEDKj7zDJgGL6fo5TldwCmN08O2fb9SIvJFc7XJG/VObfSK1UR1QZ4YL2yk6lWPUN4sf
         aJDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVs2GL2h8nBRgRoUKvzKvZ1Ep3hAdNspq3LPdOO1bgVDHm2TVRkagUbgNEvxGcpFdw0mZr9XnUMNRw@vger.kernel.org
X-Gm-Message-State: AOJu0YzeWJhVkBa2woctbogfqP2Snr7OWH5UkVmCdLi5sCTvGDi8ThZD
	Zf1CcHDgtqKAG4WJfoomy+klqD7VyGxdJOtBw6tS07UWHAzdcTsNMafM
X-Gm-Gg: AY/fxX4cMiUSeWYsCBaeNkCAXSyCS32A0W5qtaaJQxDD++Kb4Oc/N/rUHGc6c/OG/ta
	j0AfVC7k2un26yTnxDobdBMjsWd79fgan6pDF5VrQoSXo4TrR3JEihs0VVYkNkBMF+85JEs7/iL
	RYmu68n7SfDPoEJ+JbPdZ40FZkyIPPJJEbgCnSuAuhILvz7oMfXH1ex4sb2x6f3WlhioEzO3+ky
	fKIei/o3hZ3nF+iz+litLZV1SYBsRdgehj1gHMpRSBNqicYshrD1evLRkD6M447soa5wGQbN1XP
	C4fxfCBYH5EZ4u19SSXLxkpPA0b4PWnDaYuW6hV68F/NY6S/Uk+LkSYix/LKtMfL9Y/5nXAtcr7
	hw90w+G0SW05sX7v2dwqJ4XXPCAnpuTq4/qwW/e181laImQzAsdPZWZVu+wJRmGnWUF415Sd74f
	HrFRQ2gO5R77aVfPVPDNp8TPk7ZpvchQ==
X-Google-Smtp-Source: AGHT+IEcabzDD5xlxV58lCKg2Qmkv0o5BSmhphbdVWQ6X70iZBjm/abogdhIEaKVgg6QLlTaimW3PQ==
X-Received: by 2002:a17:902:cecb:b0:2a0:8972:d8ca with SMTP id d9443c01a7336-2a3ee491c20mr198647775ad.35.1768310572390;
        Tue, 13 Jan 2026 05:22:52 -0800 (PST)
Received: from DESKTOP-P76LG1N.lan ([113.23.51.12])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c48be5sm203841475ad.30.2026.01.13.05.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 05:22:51 -0800 (PST)
From: Nam Tran <trannamatk@gmail.com>
To: lee@kernel.org
Cc: gregkh@linuxfoundation.org,
	pavel@kernel.org,
	rdunlap@infradead.org,
	christophe.jaillet@wanadoo.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v21 0/3] leds: add new LED driver for TI LP5812
Date: Tue, 13 Jan 2026 20:22:47 +0700
Message-Id: <20260113132247.36012-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260113124053.GA2842980@google.com>
References: <20260113124053.GA2842980@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 13 Jan 2026, Lee Jones wrote:

> On Sun, 11 Jan 2026, Nam Tran wrote:
> 
> > This patch series adds initial support for the TI LP5812,
> > a 4x3 matrix RGB LED driver with autonomous engine control.
> > This version provides a minimal, clean implementation focused
> > on core functionality only. The goal is to upstream a solid
> > foundation, with the expectation that additional features can
> > be added incrementally in future patches.
> > 
> > The driver integrates with the LED multicolor framework and
> > supports a set of basic sysfs interfaces for LED control and
> > chip management.
> > 
> > Signed-off-by: Nam Tran <trannamatk@gmail.com>
> 
> Still does not apply - which branch did you rebase this to?

I rebased this set onto linux-next, specifically:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git (master).

Please let me know if you would prefer it rebased onto a different branch.

Best regards,
Nam Tran

