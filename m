Return-Path: <linux-leds+bounces-4330-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D21A6AEA5
	for <lists+linux-leds@lfdr.de>; Thu, 20 Mar 2025 20:41:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DED1A1883EDC
	for <lists+linux-leds@lfdr.de>; Thu, 20 Mar 2025 19:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD3E1EB5CF;
	Thu, 20 Mar 2025 19:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4/xuAUi"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE3C1E5B7E
	for <linux-leds@vger.kernel.org>; Thu, 20 Mar 2025 19:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742499562; cv=none; b=B/KacNgVD8gfbIxX9kR9W5KU21jFm7dgT7khzV6BZaD+UtUo16CPm7J/AuH0hc9D7YLsfvpsstjYGs1m4A4W+LZdZscAb5hg8tkqgG2pGV9jegsy0Del1HoPORsHVEGOtQ1cQ5E7Tgj3x/1nwnvb7pVeQZfGC9aDSy0jsW/pjc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742499562; c=relaxed/simple;
	bh=6kwDHjfzF8/F6PrR1F4YZ6OvJBBdgeudyzo9o0KXRxM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=b6vZDHjdeQgVnbNkNhRKKun1ya+c/JWqGyk5YDBtm3Yuu0uaNNH5HKV1NgbqoHKWsqZ8LvttCEN2m5IOgjZXrVQ11umtsevAGcNuF4JaaPFgKfl39M9cujY9jfsIlXn3+VbAspdRCkg71KoYuV9c7FNxfCleuCN0kuj5fR6pHN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S4/xuAUi; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac25d2b2354so218218566b.1
        for <linux-leds@vger.kernel.org>; Thu, 20 Mar 2025 12:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742499558; x=1743104358; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6kwDHjfzF8/F6PrR1F4YZ6OvJBBdgeudyzo9o0KXRxM=;
        b=S4/xuAUiFWOb3UFmKvyryOLc/p7LakOjW1DYbFlQRwHbydeeI9XjxzRnihAWpnB2Dy
         +YtU4YcO8ow+v4tp98PWUX4L0i+yQag12I7m800Lky8aRdrEII364dVch79mivY2LMlJ
         QoymHSPzH0xOQ4nBvyY9HOpPex/RJKqO56bhf+y6yCyJZ6lnd3NQQFhQ8FuYXqFw2kpy
         gHchlLQugbpbw6DFSNHO4WyAUNufSaaURxxEH8qp9NtSL5Z/LfPqL805Q84mG6GXJ2wy
         JfrbP15LuW6IVxq7G8pjHZ2vcRL0qnoHzyM3Zj081vIXEG3IuxPzwwXt2TrVaNLEskGh
         fMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742499558; x=1743104358;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6kwDHjfzF8/F6PrR1F4YZ6OvJBBdgeudyzo9o0KXRxM=;
        b=Gaeu0LaM1wDC+zsXkKDEecGSfgjuYBQZNLumkOU/TEs4A8fk7gLC5w4Vdf81mHoq9J
         cAhoobC42JyXFRSY8B4ZHVJE9FxoQ/YWa4n1acsvNmCnkqeN2x4x8YbBCHkcpU44x9kt
         EoxoXJ6ha4O+ywaVQZ/eQiyoliUTuaWCQ9uljyhUyvytxGtENilzPAzZOSwHHjGwBirl
         k4N8S3yiyOl0ID+qupClYGmo4yoPElGaIm0rNp0a2Nf7Uxew2JjL4BulEVndemRhJHQL
         djJtIJJlxy5AE1R9gJ6HgMhK9UbHVAPdiBMRHTD1HSwZk7DeRG/dM24OlEzkOHottFiH
         EU0g==
X-Forwarded-Encrypted: i=1; AJvYcCWM6n0JWRZ+sWOHO9UkNt7l4q26MKc1ECWQT9KQ4/yT3fq5x9TwuU8wU+qui1mh3lbh3EI0nERYGQ/y@vger.kernel.org
X-Gm-Message-State: AOJu0YwCecdubIonJgS59fWE7PpHtiO526ugQ2XXcbrVydbj7l+RNuGJ
	IJGq+yWUyzBWQUZhrgu95pfdrJu1EevuAXfvMZyjbVaaphhCsMew/OcWlWXcgwHWU73yiJh7URg
	/VbPvukuo8E7kSjQyfP3iOpynWgo=
X-Gm-Gg: ASbGncvDd+JbM+C0OoyIew13frvaA5+9PX96JDaI04YvCNvCtxtFOC5pRimy2JDbO3v
	mGSX/CdvfGsOM36CUEJEnJLeatYvgtRENLuMDLq1SPW7TgHASRJ0duYE4UvUj+Z1mOKjwnKyZ55
	9ztQoXNAYNlRKx7P950tqWZYX9u9mJKgAbU69P
X-Google-Smtp-Source: AGHT+IGVDLoWM7BsOAagwk+l0NVxdiIY8SVxAFjOL11hrYI7wbsZIYBSCWQRzHqcvbqvErJd2solHhUeevB8Sr6XS5g=
X-Received: by 2002:a17:907:f14a:b0:ac1:e1e1:1f30 with SMTP id
 a640c23a62f3a-ac3f2456d20mr51931366b.38.1742499557727; Thu, 20 Mar 2025
 12:39:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 20 Mar 2025 21:38:41 +0200
X-Gm-Features: AQ5f1JqXjZ8Qo1sf85UYloushEag5DTuPVLvljtriDjKgZoStSNKYWQ6dMEnPb4
Message-ID: <CAHp75Vfe1KWDeHGYMbXdExF-7mwA_vXHL-3_TBGyyvMZwgjrJA@mail.gmail.com>
Subject: broken Simatic leds
To: Lee Jones <lee@kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

This broke build

https://web.git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git/commit/?h=for-leds-next&id=f33c17919d4489ccff3dd20adc5c02dad5139f09

Obviously you forgot to update parent Kconfig and Makefile.

--
With Best Regards,
Andy Shevchenko

