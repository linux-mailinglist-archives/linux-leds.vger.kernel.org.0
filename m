Return-Path: <linux-leds+bounces-1833-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F948FB96D
	for <lists+linux-leds@lfdr.de>; Tue,  4 Jun 2024 18:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4C071C2095D
	for <lists+linux-leds@lfdr.de>; Tue,  4 Jun 2024 16:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34A2213D62A;
	Tue,  4 Jun 2024 16:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=howett-net.20230601.gappssmtp.com header.i=@howett-net.20230601.gappssmtp.com header.b="hP7bzKYm"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB74168D0
	for <linux-leds@vger.kernel.org>; Tue,  4 Jun 2024 16:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717519622; cv=none; b=lL/GQTIK5qeU0cOeaNMPSf4fZryiD9l4ueeMvz72WtGayvX/qT5SHZuHaxIldhzQnWRGC4E/T3HLvuM7+/KTeBVsECvoOSYZ9A7i7A+qNNlIPNZgFKx4zoU/ymjHypq/vhBBSWvhbDJ4zihiU/xd9SMAf7iTvPmU3oVZE81GPqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717519622; c=relaxed/simple;
	bh=oVSrnWYW3Dy+qbnzyP2YK4spEY/t8FU2eqyIxSQiOCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mUR//QNLxA3oeTOrSKKaPh9wUGNVrezbDTgPWcU7Qa9EBd0IzxmIp2P1BIGxD0wSf0wiZLvHWoxr1pK75cpoe62IWUYtS9HfWL1cdnkXONABzZCzmkNU9KjQGcNC1p90fjJGn2nG94anuhSzyi6ARkIRlatKXceHdKeW6E9Rk94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net; spf=none smtp.mailfrom=howett.net; dkim=pass (2048-bit key) header.d=howett-net.20230601.gappssmtp.com header.i=@howett-net.20230601.gappssmtp.com header.b=hP7bzKYm; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=howett.net
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dfa4ad7f6dfso5414050276.1
        for <linux-leds@vger.kernel.org>; Tue, 04 Jun 2024 09:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=howett-net.20230601.gappssmtp.com; s=20230601; t=1717519620; x=1718124420; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVSrnWYW3Dy+qbnzyP2YK4spEY/t8FU2eqyIxSQiOCk=;
        b=hP7bzKYmi+nZBbMB0RvCeSSXA9djGswKA39IVSq+SqKE0nnLxmE04+ydxts+vMPY+T
         wB+hjENSqc4hvPBg2Pi7i+qbd5UGNqe1VhcYljf0Zjdqo7MCPJZDWYWlSgsMYTxxUg5z
         kWdJdZwKup5I1oIyDEzwQvQd8fFPIbD+ppO2efG9jRd0g6AuiolPLwmMivBKEsunKBbZ
         DKpVnH5r2cKw1ukwJ4KZNtu7fKGuGHjcT9tYNiTZe+suDg3zc8q2lUsRdoJUU4TaTxPi
         OXVTLDxMVw1cVcxU3XD1r/tKkbHAwr2sAnHzXVfTRuzTHoIxa/CGyqL7pWTk6PPv6X6e
         NBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717519620; x=1718124420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oVSrnWYW3Dy+qbnzyP2YK4spEY/t8FU2eqyIxSQiOCk=;
        b=iUh941mUXpgrb4xczD2nC2QyysNvkw0Zld6VeL/+c+i44KP3975ZsmthPItroazp96
         m+6QboLfl/hLr9wJv/r98scH2fWt5Ek2TjDiPT71hx+Mfn3LTnOdvty8YqEjQo8R0QbD
         RrXqbi31wRHzFO4fzoM8PLraFKG5hnmjIwJcQh/YiR28KcEELV2dG7H0rmzqv9+UaLhV
         D9cSWSnDku5RkDCGCFFdJXVve6oy4LQ0GPy75zH6XeI0gOmYfVLXRzpl80+ZsLk6RGLE
         KA1CNmxFNBX2HoULi2W57SMBVGbPOwAF4mJRbuVRUcqnGrX5EvK8REvh97DTmE55Illj
         ONHg==
X-Forwarded-Encrypted: i=1; AJvYcCUc2+A/VwO1RerBbtazudAMBkE8yKiIWYI+8rls3TvONbvtkrIJYldX3LuAIblbWZqzqfwedKxWsCLZKuWuLnQEyO5hO3woLOwkfA==
X-Gm-Message-State: AOJu0YyPDTGPBISnrtyaBjnkbVpfET5QJTzxQA/JJ5H/wWXo1y3NuMyk
	GC/BZTWCF86OX62Spb2O5DkxCE3AvIyXWcA9FWhCzMTFSJK4DBrcE6nD3B0WkYRKy5H0EyEE0oW
	ph6LEmXbJ5wdWUD0eKfETYkUYGlCks+S6673o
X-Google-Smtp-Source: AGHT+IHMdgVbp4edXz1RYg3r+v3zS6jex/OYdamIOc4mz+GjXYTa50U8xGQcjwpv2rX/qXq+oLJeXSLJiUuBGNHgjT4=
X-Received: by 2002:a25:aba7:0:b0:df4:dd91:4524 with SMTP id
 3f1490d57ef6-dfa73dbb8bfmr12794384276.44.1717519619696; Tue, 04 Jun 2024
 09:46:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240603-led-trigger-flush-v1-1-c904c6e2fb34@weissschuh.net>
In-Reply-To: <20240603-led-trigger-flush-v1-1-c904c6e2fb34@weissschuh.net>
From: Dustin Howett <dustin@howett.net>
Date: Tue, 4 Jun 2024 11:46:48 -0500
Message-ID: <CA+BfgNKowam5s==47KcrO-JRc2QfR2od1T=9z52t1AJZFkc0yw@mail.gmail.com>
Subject: Re: [PATCH] leds: triggers: flush pending brightness before
 activating trigger
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 3, 2024 at 4:45=E2=80=AFPM Thomas Wei=C3=9Fschuh <linux@weisssc=
huh.net> wrote:
>
> Dustin, could you validate that this fixes the issue you encountered in
> the cros_ec led driver?

Thanks for the quick patch. Yes, it fixes the issue I encountered with
leds_cros_ec!

Tested-by: Dustin L. Howett <dustin@howett.net>

Cheers,
d

