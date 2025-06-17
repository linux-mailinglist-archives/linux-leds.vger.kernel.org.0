Return-Path: <linux-leds+bounces-4833-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E63C7ADD963
	for <lists+linux-leds@lfdr.de>; Tue, 17 Jun 2025 19:05:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE20E4A3459
	for <lists+linux-leds@lfdr.de>; Tue, 17 Jun 2025 16:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D252FA641;
	Tue, 17 Jun 2025 16:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TbHkFOLa"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C883C2FA630;
	Tue, 17 Jun 2025 16:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750179052; cv=none; b=NkXWq95piJCHbfYySTTqJ/S7tBbVtN1D06FqbHlGQhvVeAmg9JpDjvqUdGNPDyOHceeoBu8KIFwlbvMMARV02g3yFFi2zSwB3OrPild78zSo2sJ8pE2tjFpxOP48x3QqV5vcZwgWUamKez7Dkauyqv8GZv845xTU+BB7+ZrOigQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750179052; c=relaxed/simple;
	bh=kvX5YZmcGBW67g2eNbTrFZChsb+bypZuiwraRmBEuAc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sXJgFejbPwZHEZRsCGZgUxn+/tYa2vdg8LwnfFb/NO6RHJBYqa1LXBitY+QlQv1Sw+YVaIJQMlDVdAlgGt9xLJOTZL+i7CPR7etcAJZ83JY6h5H5TjEPkvQhGel3dtkOUFoccVjgB5oirYHwtnaM8C1396qA39F7UP1vVHkXM98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TbHkFOLa; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b2f62bbb5d6so4853729a12.0;
        Tue, 17 Jun 2025 09:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750179050; x=1750783850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MNcITrU6JuukDFgJVARWTcJMEqL8Jll48FxhL2fmWas=;
        b=TbHkFOLaU9XxeaaXE3cpggXRZL1+WAaWaBewzU4noXhTfvmSSU+nSaGNZV4NIlU+4G
         yg1FmCL27q9ja1LehA9Z8wmYUEOOxceNgo+a1P8MvezrluRiMSLFIk9txrR+bIV3RmdX
         7gx/Mb185xRm8b77+HZ9IzUyb4rDrlrf74z+S29sMwUxbSTa6aXX/hys69LRI78Ky22Z
         QT1E1ErJ2tZUjYxae9geQNX7NuSmgjNESuiC2lWKWayI7P/DvsUgOrMpIwYZ8kba/hEv
         uaHGdl/SoRZzlqFN0w7csKoPkV2vJptnknPlzXskEP00DlrbNjtnU9wiEf5kXweocyUp
         0XnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750179050; x=1750783850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MNcITrU6JuukDFgJVARWTcJMEqL8Jll48FxhL2fmWas=;
        b=t2IAhItEx8E5b3A1gemVc2qPxw2GN5iRXHzby8HlmC5h4kUi1ci8WJc8re4GfaCZCj
         PtUkR8WrqCVTyo6pYEc/xLubvJ7KqhVyV1Zhs9LjZSYYBGuXcZ4h5cBYfEJfdjksVbfi
         eXi3AzOth/HPK7v7KVz9etpZVgrcoHGCmm1Wb7lITIDMVokVU1g5iEUSzUWhqjFM3vkj
         r+zwtRIQ6ZmtXuRlmx9Q5IiVIUbO5WRle4lV2fcRSDjE+Pu6Ee0dE/BMpJro895Z0AWo
         AyH+yebfENHBmqc2LZqEhQEPQEzjjn9JjxWS+tI3K8yITx59ypfW8vOm7nJAEyq6EpLa
         huFA==
X-Forwarded-Encrypted: i=1; AJvYcCUyJr/WVqqzrH4ZHH86invCJbcbWa5wNzYr6cCpa9DpOsrQXwxxHiDNpGmgmIZMhs0G6gwpnzpc1SpQUHE2@vger.kernel.org, AJvYcCV9HnG13OFSTtPDhmrVs9qV+Xmpapp3RkltYXiicmj1XVZt96IXo6eeszGlzNIiGYll3zH2kfo94Hi2@vger.kernel.org, AJvYcCVU1ucZadWE+DiFkn3Ql/zMboyPQtEuVCrIhvrQLVWQFZTanpyWKV6SDvZUeO/xIm97xlGxVj99RuKE@vger.kernel.org, AJvYcCX9Ck+Dc+5JHk3VWVk9QW72xB80x9aTUoIC4PfXVtBdrl2kkipYort5vfKNXeHQw30dY2aUYvTbhTFh9A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4mAM77cxwI9T7uShlCEZ14jXTIFvW6/HExqAQFEaboYODrla+
	aGgustTyBsEJeLOwXcl3keZGQURd4Jkvsx0QG5OhfKLFIm5y2EO28Lsp
X-Gm-Gg: ASbGnctciwZNSinV0YiGEgBDOA/E2rxQbHLc4E8r4S9/BpdU31l2FwvDAdsKIeqgVEx
	/vZSFs3fiRoLucUGIDcrU5U3zU/TjhpXM2BvE0GhSnXrLcWzaurpbrZH/zn+nOC+Axi9WB0zKC0
	MNnL2YWuypi8N0yYLO+Qh1rIAfx83QLOfiZUeU5wIJ/QvmpASoa8D4lGSgyIGDVs6/SRTegsro1
	ejXMtKPMTbZg/SRnrPuY/3ePLUuQLqfmz+Aq0aPfKXq11wdmyQp+reGS+ujldCDFxa8t52kImxU
	5NzBdvUxBdFjRO0HgsTXaMVqWttOaf0a/GvqFmTQVXDcgIa4pa4/2DxOMbKW1km7B1qQyxSEAjB
	3WhA2WnE=
X-Google-Smtp-Source: AGHT+IFrh0CqCS+0EnmoW16xodzDguEs41RmnPUFRPeJCtO3FLwjDQLXiW4zZXZnhF4eFRlEfGg/gw==
X-Received: by 2002:a05:6a00:6f46:b0:748:e150:ac5c with SMTP id d2e1a72fcca58-748e150ad75mr1169690b3a.23.1750179049998;
        Tue, 17 Jun 2025 09:50:49 -0700 (PDT)
Received: from DESKTOP-P76LG1N.lan ([42.113.163.91])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748e3afb1cesm50488b3a.3.2025.06.17.09.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:50:49 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: rdunlap@infradead.org
Cc: lee@kernel.org,
	pavel@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v9 2/4] leds: add TI/National Semiconductor LP5812 LED Driver
Date: Tue, 17 Jun 2025 23:50:44 +0700
Message-Id: <20250617165044.21146-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <8a9647fc-3156-461e-8460-e3cade2c6f5d@infradead.org>
References: <8a9647fc-3156-461e-8460-e3cade2c6f5d@infradead.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 10 Jun 2025, Randy Dunlap wrote:

> > +config LEDS_LP5812
> > +	tristate "LED support for Texas Instruments LP5812"
> > +	depends on I2C
> > +	help
> > +	  If you say Y here you get support for TI LP5812 LED driver.
> > +	  The LP5812 is a 4 × 3 matrix RGB LED driver with autonomous
> 
> 	The '×' character does not display well (not at all) in menuconfig
> 	or nconfig. The graphical configs (gconfig, xconfig) can display it.
> 	I would change it to 4x3 (letter 'x') but it's up to you.

Thanks for pointing that out.
I'll change it to 'x' for better compatibility with config tools.

Appreciate your time and feedback.

Best regards,
Nam Tran

