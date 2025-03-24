Return-Path: <linux-leds+bounces-4357-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C988A6D38B
	for <lists+linux-leds@lfdr.de>; Mon, 24 Mar 2025 05:34:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF83016EA7D
	for <lists+linux-leds@lfdr.de>; Mon, 24 Mar 2025 04:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E74812EB1D;
	Mon, 24 Mar 2025 04:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfBPplIw"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D762E3383;
	Mon, 24 Mar 2025 04:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742790873; cv=none; b=kl84Flgl2r3FdTToODeWuU6EFg6H/9a7u5I1oMWf20TR/i3EMMW8b3v31+8iVlr+xDa24Png24uOAzWErMjVvjy0Rt4M9aZmGe2W/hb8o7TqMIp4WYEHRWvbKrerSvLpDHxHx6fT0G797zK2C1Ffw8AYvNya+V8kOjqLtKhjKoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742790873; c=relaxed/simple;
	bh=I/KauccPAuIUUyygZIwODYR2nJ2wCjMs4XIaCqzCPPU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fN6S9giLEeSqr/z33l2JXVPdMPydZCLKpTEGOpi0x0IYuCzi5BxzMh8oDwhv2sj+QWY38rSQzeAbzgifB073ilZ1LV2uggMJmqId6CyLZrDLZ9Js6dWNlkuC97ta0X3FE3OafnkV1TpvKM50sgWkb0AOtjT6sFrpD9pM2MhScWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfBPplIw; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-223fb0f619dso75810215ad.1;
        Sun, 23 Mar 2025 21:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742790872; x=1743395672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/KauccPAuIUUyygZIwODYR2nJ2wCjMs4XIaCqzCPPU=;
        b=AfBPplIw/bS3025GXAkardXMGFiXtwa9qGRfRgDSNr1GA1LGFbALjkM7CH5PMOSn3M
         jRlGWMAtE4eGiVi7q4/org9K9zyKp2I7tUQl9ofCrWEFb/T8jbDtmEiM2LJN2MVr+53G
         FxIiGPm4F0BCHOUNyrr3zRE+PmIsAC9nxLVNn/HLZIQISu+6Fq1y8OvJE7K1hKzzJmHK
         H5EwwOyXghZHO6wCePouiOsV94r8yiO5qTk6IKkja7UG62m4eAI+KCndQ0RtGA3P/6M2
         +5JFXluQ4WQL7wZsjfbnUbSdNy5PLBg8JQWIfOE2JHtiDT/w/ILFad60tOVn0A0qmt1c
         RbBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742790872; x=1743395672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/KauccPAuIUUyygZIwODYR2nJ2wCjMs4XIaCqzCPPU=;
        b=J0Xu80Zx6KolWBwyk3T45q1D/svSDZLuB1ou482gzY47pHvjHaqPtJAnb/i2gk8QBt
         vcTu+4iemTBQ0HuAImdenQMaJyJfdtEZEpNKuZjeRapXJRbo9ml5L/7CGrojQ6E3qz5t
         xnlxVzWcE5yPwdQHf5cnRqCO/NsJjYdJ2VAYc9zwWf7WgXMbFwsPNEq8Sat/uiUj3eL9
         IfFI2C8DH1HlzO0I08yUIi2ODXAI+MZRjI/P0Yehlaq3Gsu02ZxS5bvXMl+uEQxVjk8A
         z4kRDY5NXo5S1iWFNX9B4zVfIK/HzvFD9FhTo7j16U6CCHmh37tvWwaoeRXK1C7JVWJI
         mScg==
X-Forwarded-Encrypted: i=1; AJvYcCVm1C3o3BL9tqy+0moRXlQPkja1f2RUAkjCVvGHHD+7H5HwqQh5GUYGtPlhcRN/rbdZc3wO2FLRnntCmEdS@vger.kernel.org, AJvYcCVpSwR1GVOsTByfxpfRAAtjSBt7SCaJ4HYh50KQemfUOmK7d9x2bcfAczzi3cH486Q/ggsx202Dfltn@vger.kernel.org, AJvYcCVseX/3f9C6Bj8Ms6fSm15oMoooc3x61nmG/q+OARRX3AUm9w/QMV2OMzhxG6HCb0jjilhONBXcicpFqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLPjaLdbkmXsPYlkffsA7VjhXCs3KT53VbYcIedFRAXJ6dRIRq
	BP10/je+G79aHF7aYqAiUuZFrfcYwot92zZ3e61h5M+xitk4xs29W1raaYF2
X-Gm-Gg: ASbGnctzSqIu4kZu2fDzcd0alCWmj3SyUl81Mo6FoHiR4Tm1SuWwozXMXhVFxwOnlfZ
	SZmyzHLh0aqlkUPRvJBSYumvPeY+FkVYSJIr4vIYJEwB+P0+UdWUSy27Gd5/AYDhgfTZkQs0p7C
	qPrMdkPkP6koDr8dYESVSrQnLH//iybDZyjXybaZOTRK4ulnqqE2ZRyqTORJg1C14N5E2YXmHQY
	tT19lLfadsOZjsdAxxtULGQ/VfKBoK9SLokLZe/4YbbTuovp/3IpjQxFfLKyHXgkFfH7iM8lrQB
	m9VVdmaW4ek7r7gTeSAdcQ/SmbAb4KgKCLsJ42gpTKttcz5NvmrdmYEoeAitBaveZSU0
X-Google-Smtp-Source: AGHT+IEA2YgUDTs4JndOkGPpH9t1CsF5sL3RwabFC5JDF8x48W//RtHV9Udnl71HEc7Nh14BhQz2fw==
X-Received: by 2002:a17:903:1aac:b0:223:5945:ffd5 with SMTP id d9443c01a7336-22780e110b1mr197060465ad.32.1742790871418;
        Sun, 23 Mar 2025 21:34:31 -0700 (PDT)
Received: from localhost.localdomain ([27.70.184.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811e3132sm60696135ad.200.2025.03.23.21.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 21:34:30 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: lee@kernel.org
Cc: pavel@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] leds: add new LED driver for TI LP5812
Date: Mon, 24 Mar 2025 11:34:04 +0700
Message-Id: <20250324043404.14078-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250320155012.GT3890718@google.com>
References: <20250320155012.GT3890718@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you for your suggestion. I appreciate your guidance on proper email formatting.
I will ensure my future responses follow this standard.
Your feedback is very helpful for me to improve my contributions.

Best regards,
Nam Tran

