Return-Path: <linux-leds+bounces-4532-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33399A9851B
	for <lists+linux-leds@lfdr.de>; Wed, 23 Apr 2025 11:15:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D5753A3159
	for <lists+linux-leds@lfdr.de>; Wed, 23 Apr 2025 09:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C97861F5617;
	Wed, 23 Apr 2025 09:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n16VRcCE"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C51223DD5
	for <linux-leds@vger.kernel.org>; Wed, 23 Apr 2025 09:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745399558; cv=none; b=tAZXvKoAQd/i7JDa/m47Vi14XGCMEUMkztaJiifxSnvQ7MH/mT7FqwmneqgtrmluiPEKWHV/BlndAY5/mlpV8J9djiN4DhlGTTNy8Ktpr9iZWZijooL65ag9jHcsPqFT/zGtu7nonh1Ww5X5anxzOZmGcKfwdtj/wg9cbKwNyPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745399558; c=relaxed/simple;
	bh=QJeCOUQziwmIdB/2LLzhfScLQ2aSa3e2mHo767LOC+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UbY3FjM/fh+Gf8eO+nzCaGWAosUDybgoQA5H9tYKGELTL1XpYd+gFgapbg20VhaAwSd+9S8uZi8gUgBPmd+Bb9m154o1cTMco4svOtPNeLnP1eVS2ncpWbVDWhlsyadd7JyMz1OHX0QD9mCamD6iQotJqKFq7cQw3OUy9MY+Jr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n16VRcCE; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54998f865b8so5794517e87.3
        for <linux-leds@vger.kernel.org>; Wed, 23 Apr 2025 02:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745399555; x=1746004355; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJeCOUQziwmIdB/2LLzhfScLQ2aSa3e2mHo767LOC+o=;
        b=n16VRcCEVZTTWYW6xd3KQ4jpfM/N/vB7WJAt6Ly4Vflj5vXbuJbg4FcBJRoLnyQI12
         0ysdp6iuZ7rMhV8QzmlKQD+nftCRWUJ4JsfXXwkmCl21qgZCIZK22ygJAtMQvuYFVvtQ
         M99Xa27BHMyOSLhKUNW2QKyMV0u2i4vkcX6RnKnBSEkpKq1zMVJEjhjSRgfMuY/sktfR
         0sAnxCPEJ++JgzzmI6Mt4XZUCALNExcBbRnsT6vhvL+dEwdZYry0W8dCX6OK81ARYGqx
         1PtssvHgL+R1dMKxmmdvQn96vnbj/0b20lIroqn4/BSAo4gKfkNvtCZ13Vmr4PdJOyeK
         0Xvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745399555; x=1746004355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QJeCOUQziwmIdB/2LLzhfScLQ2aSa3e2mHo767LOC+o=;
        b=BnGRrsqmVPT3WhaYRdzHJObS8UvmiPX7ov0yGThtW9ITwAgmw+7QR4ZqsqMCgrDqXV
         5JxnuhnuqEEDrkHUu/avE+cOO35wCY0Rg2Z3EwdNur9v/1hyE1xAHiknGLmeftUAidtn
         s6a5QRXGHOLl3LsQ4/peMBKyM16ryQrRdmDUzRJNHveVZvKnFfEjUjh8mdY7GJMI6SMm
         Y6QQgYrY0mCpoLxqadgJV1f3gnMvKIRh+lQa8cKKio7x5U7/qKK1U7t5Ga0OIGO9vMoo
         7PyaTrw3ddWpJl/1xgAAlmrZgz2P3STq6sUMS1H0OCI7gw0ZmVcgI1qvh8xqIDuWKcwb
         4t5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXzhPkiDc4DRlu7sX63wqfuzoCLZhInzKhY25o1McS60bZqMYzYFGi7mQxYX9DloGhaM9HdkHqu+07H@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5pO1PnzYHXOiCqNWjzguOqOV+0Lb1vJhQFY+ARQwdQkCL4cDB
	e7HsgMO25yRt9ZEUZ5EAIY86tlLsL5ag2Dba856UucJbEAZ5+NAqWEZwOJRYG4pclKra4RWxRs1
	PceVqav2D6Bj7Rec3OCOpq/oSJE9QUrjSpyrGCQ==
X-Gm-Gg: ASbGnctG+KwUHZKiHa1XkawiXWT2ouBoc7tl1c8T1WrAEGPDHVtmMzHG+tazdGpbBMD
	NosNZlgfdhQ8K9xdipo7BgOofPCuDb0gQyC7JCvLnv2nRErw0gXW/BXI35tkHI125lumFDNgClo
	52X6A9odHvmIJijAs/cxKOAA==
X-Google-Smtp-Source: AGHT+IFF/xbTjLRtlqEGbjqNcxexgFOsx5O9KwDgL/LSiumuEdEwznWo16XbSoEfrNMe+sSZFz40FiylyZH+ARCcP7I=
X-Received: by 2002:a05:6512:4027:b0:54d:67d7:c52e with SMTP id
 2adb3069b0e04-54d6e629c18mr5591182e87.18.1745399554909; Wed, 23 Apr 2025
 02:12:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423-gpiochip-set-rv-leds-v1-0-2f42d8fbb525@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-leds-v1-0-2f42d8fbb525@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 11:12:23 +0200
X-Gm-Features: ATxdqUEmXWqr5ybXE-1jp9J-42SDUfB2VtIVs5Nq-RfO1-UEQKemrbEsyN5V6HY
Message-ID: <CACRpkdb1YRd4QmBnRpedMrmCb4AiY+KjCxfAmm9zRQkeTUsrBQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] leds: use new GPIO setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Riku Voipio <riku.voipio@iki.fi>, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 9:54=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts all GPIO drivers under drivers/leds/.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

