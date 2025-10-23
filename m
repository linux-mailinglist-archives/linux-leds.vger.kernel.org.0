Return-Path: <linux-leds+bounces-5869-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E711C01FF1
	for <lists+linux-leds@lfdr.de>; Thu, 23 Oct 2025 17:07:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF9793B2797
	for <lists+linux-leds@lfdr.de>; Thu, 23 Oct 2025 15:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7593321C7;
	Thu, 23 Oct 2025 15:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KEB4YJkx"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BCF25F78F
	for <linux-leds@vger.kernel.org>; Thu, 23 Oct 2025 15:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761231795; cv=none; b=eVwgKd/LEP5MhCZ0s3kkBW2OABf5f3Sb/BbFQg2Ac/IpZ2MYXE/EDY7ZpK3PmfgI/pqcXEl9AvGzxscvvbdCBMgvw3YtHOfRKDxZptKZyQQpp1g7Ix/2DhctZoZ4w1BdDIHAh+Z1PaYOVW2oBuauvXZeX2gaHTk/caYE2Qlu/8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761231795; c=relaxed/simple;
	bh=cVWNGUBv5f1XokI2wDlImIvCfth9mSxGURr6U6l3IwQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AaBBHU0VuYbZm/nkvHZm1ysiGG2gBfVdtPTgZseVa2zNd8tShEDobfzojJUiOlyJbjSeXbOvpx+w6DB7GL7uF8J4w8q8+jzYSj4/thMLwMzMOYcfViRoJITNtngLrBcUssfs7REl3t2bLsgPM0EgOFtadAeOhv5Waf/xshiF0LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KEB4YJkx; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-87499a3cd37so5468466d6.3
        for <linux-leds@vger.kernel.org>; Thu, 23 Oct 2025 08:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761231793; x=1761836593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IDejrPpS8JKdp0yoRJvhpKqRYlatSQOWWomM9QOqSGM=;
        b=KEB4YJkxCFExPWwdEpTYf6ptld7ndILkIZLblr4jJehxBxV18zHFJ3ZadhSfUICnox
         +Hw5JOSd2XCN/htG1V+OwHfU0FWxRIsFRBvbrVsIddLiz1l54SsApuRXe4jxD6km+Riq
         IvK8bawplDJf+0yPZGiI6XtYTsaV5lUA5KuC8BlNw60ae9S9doPwpHdarkbW9gzMssNg
         tGHke8SnTw9jBvmGpFMU3axw7y35g0BlsY1ag6nPGmHWlqNI3mRw3KzWLybVLHTADjbZ
         +Lz5IIPrBjgCi/ouu1HBBHhbqPx/ctDlB0G1ekZnTbr2ZgQm4GSUQJXhBFiEVdvrw6Hr
         IK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761231793; x=1761836593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IDejrPpS8JKdp0yoRJvhpKqRYlatSQOWWomM9QOqSGM=;
        b=FbwUZFq0sLQ5JYD22JhY2TznqQFVFFbHSvu1c4pmfIRunAtcQKIzd7hbVEmokVUVOh
         eQuMR+Iz7oFnV6Ce9UKDj8TPsVS/s5kRj59D5s7/fNjmAwa36hLCIT88VdGMg6p7fqCn
         7QuzwtvU2reGTIKG44mqHUDFwK/f8Gu4HDIpqfPkxQSN1E5b2mjggs288693QqoP7ZXA
         9K15m5/b0UmsotZq/tI4vdRLu6CMBESW9KdjCSF70v8pV8J/xDhjZYLP1LofsUZyoPXC
         d7ghAEd/Bjdraoqrwd9S1f/ZoMxuWNBndwAK8pYZ4OBcYRMD5ODXYDJAUPNb+MdhSFJ5
         M8pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQ75T3aemwU9MJAYniWj/SvD9QxMNOV5M6aQi/MeB7jPx7ZiBi4kqbPwIOlePYbibRNDwLRM+f/kcX@vger.kernel.org
X-Gm-Message-State: AOJu0YzFJAc0a/SuXbH9sqKGxQ25UDDc+oXnx2t4i/f4Jhk3SyfXkZU2
	xDpqxhZpFbfn51ofvJtRlVf7S3LusVZQrK48I1wpdqj6mg/A+dpM1MUJ
X-Gm-Gg: ASbGncu2MYuRC1XTiszC5etIrOtZECMOEiJtXOHZeqPeEEVHZQCbH/ii26G5HriHgJE
	ExWwDObo9K4eWeoR/2IjfbquAKQbMObXf4Zxwb+ZIVdiwES+2fKOykyQEPGRGY9tIdz9VgC0l19
	+kpPmJcOi3g4yC6olFP+l5xP9RgBC9vfCDRudOLPkom9DbyxF/62eQdBwS1daRlvXCjx5TVUbJL
	LkpnMvWsODXS7xeJJvR1IGIjMw31kJmN7MC+zzkcbn7tl2bLq72xCJGmng88srwYRECVmbysWLJ
	HuEyGbXZkk1SMasJ24JZxbXAuLWryLaWbUAHsySnPzR9nO7HehEK/2iM7ShFMuZa+RLJohmCY76
	v2WWs9OblonPgizMVVt/RNSO5BkfNA7a1yxHeiCJ6GVTx3qulNwB5v0NwYcB49jcGgkpdZ0AVob
	s=
X-Google-Smtp-Source: AGHT+IGIjOHXUHoB7tory97+mHmrm9QpKeKeYeXqegjPa/rTqwpqY/INhmbtlixC/59BqCdhkar35Q==
X-Received: by 2002:a05:6214:226c:b0:87d:e791:45f3 with SMTP id 6a1803df08f44-87de79149d1mr133613806d6.48.1761231792328;
        Thu, 23 Oct 2025 08:03:12 -0700 (PDT)
Received: from tremont-lap.lan ([216.248.122.3])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87f9e7d020csm16628336d6.35.2025.10.23.08.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 08:03:11 -0700 (PDT)
From: David Owens <daowens01@gmail.com>
X-Google-Original-From: David Owens <dowens@ptxag.com>
To: afd@ti.com
Cc: lee@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	pavel@kernel.org
Subject: LP8860 driver writes EEPROM on every probe
Date: Thu, 23 Oct 2025 10:02:53 -0500
Message-Id: <20251023150253.971072-1-dowens@ptxag.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I have a display device that uses the LP8860 as the backlight controller.
Recently, I switched from direct i2c writes to control brighness to using the
leds-lp8860 driver and noticed that factory provisioning was lost/over-written.
Is it correct to write to EEPROM every time lp8860 probes?  I've read that the
device can survive ~1000 EEPROM writes but I don't see that limit specifically
called out in TI's End Of Line programming guide
(https://www.ti.com/lit/an/snva797/snva797.pdf).  Even so, Writing to EEPROM
during every power cycle doesn't seem right.  I know this driver has been
around for quite a while so I hope I'm just missing something.

Any insight would be appreciated.

Thanks,
Dave

