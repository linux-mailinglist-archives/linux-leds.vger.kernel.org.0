Return-Path: <linux-leds+bounces-4502-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5378FA93142
	for <lists+linux-leds@lfdr.de>; Fri, 18 Apr 2025 06:44:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EAD9463C2F
	for <lists+linux-leds@lfdr.de>; Fri, 18 Apr 2025 04:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D58D24E01F;
	Fri, 18 Apr 2025 04:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TaLQgiKI"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CE51CF8B;
	Fri, 18 Apr 2025 04:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744951454; cv=none; b=rIn/2AqcJTMimkQ0r69M5MROSb/Jnc6RNf5nxIJdPL7B3w6iEzSZpLsNYJy97F/jE807JFjrjHZJBcr84HFQczKXkGk08MeeJ5qochtz+DWPwWHG4WPDOWyF6F9xR3yGZsGvH/EE5AUkx4N5Dzpt/7LO5UxvShpcck73hAIP1Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744951454; c=relaxed/simple;
	bh=+9Spme8zVgSLflYPzGjB2Vr5F5j5v2nc0TY+ZZ+UmOM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DSCWOFuDetrmUtSl6RnVdR+qT/f+PUR0I/1hM/Y/fi80gxCSC7PB7YIo8EKoANiWi2fYzeBEVQn5ps1FDB5AC3BHv/ADRcaKO1APuAI7g06eO2KGcNWDiElbRXWBdv03UK6iQpqC4S/ocg0DZIVLNsEuiogbHAjJcTIcpWOQ8Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TaLQgiKI; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-223f4c06e9fso15419225ad.1;
        Thu, 17 Apr 2025 21:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744951452; x=1745556252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3+m5i60Hgf5/hW91D5ggRX+ZoVsLTSbAzvkRpVKVQQ=;
        b=TaLQgiKIpGnfbQ+spOJ7gMRrGFkrdizvw+Z7hcirMIyj98OGu7ZWbtMZFjmU7QDfHj
         p3okWL6cdK8HIcUid6lp08raXDlHFslDzo7YVLbEeTyBpPGVM22GZhw03B0zMkdcNqEE
         5Gilb/h65UvIwilTUNVj/yLMjkIR3H7C0E2vI2iWB8ZCYn+XjhS8JajS5pENpILVI8sC
         gAU3al6A3LdrAVK1cTOr0y5su9Si96eDF1mBP+PjbHIfKFEqMjw9o8xmPvVFBEYvu0Cy
         Is0q+uQ6fxs2EqKT8d+KpZWpw8NboAZBDRutArCgqsuS6OGIOiqBoeu2R0iZf5A8MlzM
         uUCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744951452; x=1745556252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3+m5i60Hgf5/hW91D5ggRX+ZoVsLTSbAzvkRpVKVQQ=;
        b=i8SehppKbptVWetoKyYSmDAYHbC4h6ogGWbOBxS3lzRwrBFi0+NVeXfEvH38iwIJZ/
         0qOQgWw1udvKs0oFZpb4MMfySq9nIvGZHHcY8c5X1C65KnoLea/D7JmO07rCERfobEE1
         qOZ4eB8yc4g/XrEyOCwRBSaWTa/AR+l/J1qRWEeIrun8C5kb6tu9+NSdS/qWLjdBItHR
         vZkbz6FCpJHN6qGWzYkyPF7bthtU7eWXRmC1gxBOTSz972AVQOm55bPBDDLsEIpLt9p7
         /9pNUANAy7oXiUCBVS9Vsc7L8CVB0hPYkpuZduerArUnnpbvzeCW0J7RovgzeXzvCOiU
         8KLw==
X-Forwarded-Encrypted: i=1; AJvYcCU/4oA1mRSMqqZTTxOKt95az3HICLh+moZKHPMwRY1SSEuxLgbJSou7G+A4DLdHXWvysrmjPHqSeMnOjw==@vger.kernel.org, AJvYcCWpVUDoOMPZsyoKTl5tCzx1OMsorF13SEBjTFPb+zU4+uhMXU/xcZgipO1B5ZyWoyt0PRnN9fQHLnEw@vger.kernel.org, AJvYcCXRzE6aXJl+fO144b9UJJctUnrDKVJNxOxZyW7hpz8E0OufnERSwX8vxnsxnrxzZCtgQTqLVSBWqSiRmraA@vger.kernel.org
X-Gm-Message-State: AOJu0YxA8TI6EyiNnZCpTwNX1LNjBMNZKwAbTgvZYXLR96Iy/L5qcm4x
	7KXY/qwXQtjeNyI2eBDpRn4d892Lxc+/k/3ziUwnShxwKPF6+apJ
X-Gm-Gg: ASbGnctA4Ri4pO3hCXQDDFLtQhCdH5qFdTzc/XZbFEzWWTBA3KKwAQO6bwXb/h3aX4/
	A46pcHfl9Va2gak9b/ayqDiBIhguS3U5dHd20gBWGG/VgTha9eM2ejXBAXEM6GPcZhXz8NKXiXr
	hrko1IBpM+eb4O8lZaG2ATthneKBL/HlcZHy4Sw9qXPLvpxQhhLjOBgle0rLyZBiZUtBG8oRsJG
	0B2xYw+GlmN28DHCgTiNsccV1M52MUWT1piXnlKeYOwX75iaSkfYyYoVq+sLTFY9Y7eJvVc39Tl
	RBJ4iNkAPpAl9e2dvkdZRKgdzv9t+bxqV8FnC9aFYU0yh1Hh8IYyABTQ72ekSpbz
X-Google-Smtp-Source: AGHT+IGG27GNTEVXKZjMc24CwXKT0odiOZf7B9a79Q3vI0Ulw0HPJWYOFLJbAQV9/TFvD7E/bFW49A==
X-Received: by 2002:a17:902:d04b:b0:21f:40de:ae4e with SMTP id d9443c01a7336-22c53e3b254mr14679875ad.9.1744951451647;
        Thu, 17 Apr 2025 21:44:11 -0700 (PDT)
Received: from localhost.localdomain ([123.16.133.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50fe2411sm8652185ad.256.2025.04.17.21.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 21:44:11 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: krzk+dt@kernel.org
Cc: pavel@kernel.org,
	lee@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/5] leds: add new LED driver for TI LP5812
Date: Fri, 18 Apr 2025 11:43:45 +0700
Message-Id: <20250418044345.2491-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <af6893c1-e103-4744-bb6c-630371d56783@kernel.org>
References: <af6893c1-e103-4744-bb6c-630371d56783@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 14 Apr 2025, Krzysztof Kozlowski wrote:

>On 14/04/2025 16:57, Nam Tran wrote:
>> This patch series adds support for the TI/National Semiconductor LP5812
>> 4x3 matrix RGB LED driver. The driver supports features such as autonomous
>> animation and time-cross-multiplexing (TCM) for dynamic LED effects.
>> 
>> Signed-off-by: Nam Tran <trannamatk@gmail.com>
>> ---
>> Changes in v5:
>> - Rebase on v6.15-rc2
>> - Removed unused functions (lp5812_dump_regs, lp5812_update_bit).
>> - Address Krzysztof's review comments
>Which ones? What changed?

Apologies for the delayed reply.

I’ve updated the ABI document based on your previous comments.
Regarding the binding, I’ve removed redundant descriptions and fixed the indentation as you pointed out.

I’ll make sure to describe the changes more clearly in the next patch submission.

Best regards,
Nam Tran

