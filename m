Return-Path: <linux-leds+bounces-4371-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 509BAA735F4
	for <lists+linux-leds@lfdr.de>; Thu, 27 Mar 2025 16:49:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A957F1895770
	for <lists+linux-leds@lfdr.de>; Thu, 27 Mar 2025 15:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3E4219D086;
	Thu, 27 Mar 2025 15:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OG157l+N"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688B0199FD0;
	Thu, 27 Mar 2025 15:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743090566; cv=none; b=RoOWzzwc9Ene3wu6ZC8wQmLafKo4zEaVQFaIQ2bLBFF8jvV0xbY3VSjlN7doFQM4CY/3NqNkWPneLOi74gHbryjp30wlQsboyMb8gqSxkJr+tY48x+3rduw6qjq6JVru/kwn0eM5T8Kg7zrLxu+6AD440Zw9eaeNZhFHSmD6tTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743090566; c=relaxed/simple;
	bh=elfMlxrS6kGLHeMEAlhoAF0O22V/4rVmVHhv1058vsg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e/wfVJS0lUzWd1N/OiFGK2cYxUIyLNPPp2arYR6uDupdy4KsYRbOP290SOAb3B+Y+SKvEYgiYiCaV2eLg8Qp2xVfaWqV/CpkO+9xUivbFBgxnZviM5z2HmpzsC8FXQDXN2H4nRo5PclJdSkuDP8V+KMo0k8twG67kX9IWpYMFII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OG157l+N; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2243803b776so38549045ad.0;
        Thu, 27 Mar 2025 08:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743090564; x=1743695364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zn7bNUo+HFkxvlbL+ZekfSmROdZJj5DBDz1UXfXO/qQ=;
        b=OG157l+NI3GYIEox0oi+AIM1nJEVagzU6iy4INgO/C1Hmag+QVCNwHxqjghPXe37Rb
         hi+5j5iStdKD45BLpNJFbCta/aJmv4F5HmNLUSKgJJbluWIKcOGwouecheCV/izz5KlP
         s3zMqQsisGtt4yMgfoy42QYfiSsls9l0WUM+LneaTpMKdy6eNW2zKQ6EJg5th8mXiBGO
         lwfGVlCJEe8CG0FzJnYQepBK1+qAbx2S3krmW/igUgJUHHgsq9llMwytFCYV6DrrTANI
         aKxLKRk4NE7r6OvCK9i81gyQgh4AWozpOylGPSMmi634VxmhjkwNqytjDcK2huyEU15n
         +VwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743090564; x=1743695364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zn7bNUo+HFkxvlbL+ZekfSmROdZJj5DBDz1UXfXO/qQ=;
        b=uIDpuvipAoA20+zHBOjcYz3vgL3+lnijiBk/d1RTIFmOvYWOoKfP7yP9mDV1k83E2D
         WuZ+3OUkTMmbUBNwFo951l0c4V3p2oByRntZH8+zJnQWE+7EGThYueGITjwVc4e9MOGy
         dVZQ+s6MyYnNEGUzDvHvkgVe6PuGg+5sH3NEZ/djHDOXZlsArH1NA/w20+crwVTp98GN
         ajoM+vFHBq/ctQp1pkCDiuY1unqEhb485y3LThOjX8cIHR/7gkEulLcT1GptdM2QxM/1
         wbAwSH5fptJBMdkR6Ys6e9FcNwnx1MYIwNGq+aohqdqER8LhZAu+E1dHkBTJ/jvoaXr1
         JsPw==
X-Forwarded-Encrypted: i=1; AJvYcCVO4cWazQMXFuN2oADT7tJusfUgFJxN2U6O8sfTGG1hTkjU4CXnqL6N2GKyBHclsPTLbiVs5DF/crmkrw==@vger.kernel.org, AJvYcCWGqr4KBEh6HHHsdeF/ZKyMoqbloKweZ8nbpGm6GV6mJSiNuDv3ZN3esciaGvWr5dwRSUQTJay9qMc1BoJ8@vger.kernel.org, AJvYcCWoYSFdCHQOHl+tVg++zU9tPuWLaVafPVn44zf7ZVU0GXQS60vH61vsm6c9WutqJmiV/GvWu8Hgnb4a@vger.kernel.org
X-Gm-Message-State: AOJu0YwHXTUMfPv54Y/vH17UoiuzWkQQQzLz20PoIzDyAcABRGoP5BoP
	TB9ASVMc2I2DR3H7mhSDzYp29y2uWUkat5OCGo05TXNBq4Om9l2kJQIiky5r
X-Gm-Gg: ASbGnct/Eya4BvuKFvGIukXEcEUFS/7q2geeR2KGeIouAyyiBEMccBdrOg+90rhjlF5
	91NRuLZgZjVZ7rXKIYXnu3WbABsJsyuyGruKkX8MpIncccTaegHbJ8OOgRWCepXHK8Maveh6BKD
	zyEI99YX1vPcM2zNEIG68AFk+ponk4jXfBpWnzKaiTqOv+wSRqtadVj9kejcKoyWxQZapfkW4kr
	vwfOMqDjZZSOMNBBMBXOYKPi7++cgEYpkOpAx5l0WzrAysmnl0v5niMZxmiOV6ruxe9M00NGrDg
	r+ommxGjMHFXUxfLSgsEbOrGqZasu1Kyvt4UD1wLPgOr3/5F+QyITdF0Pg==
X-Google-Smtp-Source: AGHT+IH2afviDzwEnBaJvIy/RsAZ4zjvX3iYEvZ6wyRfysO4784qeMX36yVMJjEQINW7tW8W8YhqSg==
X-Received: by 2002:a17:902:ecd2:b0:220:f795:5f14 with SMTP id d9443c01a7336-228048cc236mr56036985ad.27.1743090564354;
        Thu, 27 Mar 2025 08:49:24 -0700 (PDT)
Received: from localhost.localdomain ([123.16.133.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee1bd1sm1262205ad.68.2025.03.27.08.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 08:49:23 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: Markus.Elfring@web.de
Cc: pavel@kernel.org,
	lee@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] leds: add new LED driver for TI LP5812
Date: Thu, 27 Mar 2025 22:48:58 +0700
Message-Id: <20250327154858.4498-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2bfc3077-7ef4-45bc-b747-caf0a701f987@web.de>
References: <2bfc3077-7ef4-45bc-b747-caf0a701f987@web.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> …
> > +++ b/drivers/leds/leds-lp5812.c
> > @@ -0,0 +1,2190 @@
> …
> > +static ssize_t device_enable_show(struct device *dev,
> > +		struct device_attribute *attr,
> > +		char *buf)
> > +{
> …
> > +	mutex_lock(&chip->lock);
> > +	if (lp5812_read(chip, chip->regs->enable_reg, &enable)) {
> > +		mutex_unlock(&chip->lock);
> > +		return -EIO;
> > +	}
> > +	mutex_unlock(&chip->lock);
> > +
> > +	return sprintf(buf, "%d\n", enable);
> > +}
> …
> 
> Under which circumstances would you become interested to apply a statement
> like “guard(mutex)(&chip->lock);”?
> https://elixir.bootlin.com/linux/v6.14-rc6/source/include/linux/mutex.h#L201

Thank you for your suggestion regarding the use of guard(mutex)(&chip->lock).
While we understand the impacts of this approach, we are currently not planning to change the source code in this version.
We will consider incorporating this improvement in the next TI LED version.

Best regards,
Nam Tran

