Return-Path: <linux-leds+bounces-5105-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 118B9B0C41B
	for <lists+linux-leds@lfdr.de>; Mon, 21 Jul 2025 14:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F31DB7A740F
	for <lists+linux-leds@lfdr.de>; Mon, 21 Jul 2025 12:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B13BC2D3ED0;
	Mon, 21 Jul 2025 12:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="sMbipTJR"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369662D29BA
	for <linux-leds@vger.kernel.org>; Mon, 21 Jul 2025 12:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753100889; cv=none; b=cSLsNy9tyMio9xvDsfOHlQIkTwfkOSM/4y+CLZPnLWJTsq3+jhOHrTFHGvTiorX6zQvLARVdUSKAZHhBMltUrDLKKgF0wm4OFzYb2+ElWHOSDMYK22Mw1ka3g5foU9W8Rpdt805F/rZI/5uI+wc+0ZX0x+H+8P1QwIdh4gajyws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753100889; c=relaxed/simple;
	bh=2Vn0aaHBna3jhvDqCj6KN/yLEG5ltghGc9j1bu034LM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FSPGfVewNs1Y2/NOSjlEkfq6ZwVl38gwiUAeJrPgeukT0VjIfnh5nzOPp2qXcaeYOT8/JPHbECcFyMcROyiBHl8bsg5TPfPz1t3GLIdziiPyAG918JznShjmbbqYIaCBI0DKx2Q6ZtBjz4Ip+dsCPKcfTmr1B5v2boGwUuRH1wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=sMbipTJR; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e8bc13221eeso3929903276.3
        for <linux-leds@vger.kernel.org>; Mon, 21 Jul 2025 05:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1753100887; x=1753705687; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2Vn0aaHBna3jhvDqCj6KN/yLEG5ltghGc9j1bu034LM=;
        b=sMbipTJRSsUWiUJtdKzXEmHKm2z43bZznA2+7reXOBZ7hWFoTVt4Ozk6EmLY+fSW2L
         QF2SR+Gqt+bgEIlAEuEF7ChjgOLJtlHQ83wGXOcQ2oGG2aWUEGQwNRBimtC/T7WnC9rm
         AHJTRhuah2b0EhzVbN9s4c+yDPfTAp913YF4G/dB/EEoX6/2pllAx8RPzEgKyc7KyTuc
         7o5szQLAJihSK3w6nMNH7yxwFiM45vL/37QkxZOJuyHdEXhxJmdouQNbUG6okdlKN83z
         jjcT2IHN/ulGkIAiiX35TSZLxRlWqcuSD7WyS3z9Y6Wg5bXbA+qnQxQiOlw1mWFgZhs6
         Zxhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753100887; x=1753705687;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Vn0aaHBna3jhvDqCj6KN/yLEG5ltghGc9j1bu034LM=;
        b=vFeYCrQriOVl9PkGcNbpfaqNJ9npWvbWNZmpT8JqU9UyFsMPRKXur3iqvMbqFLSBD8
         V0fyMq49Z2ACMM/DAhLTFzokW/zIBRm5WU7rLCFaeyfKIkhG94aUSQy+DGThQtdda0u8
         d2s48njyqx2Ih7+Un+n0rteYCNeTtbo5UB2H3HF2qvOtoQC7aAUraHwbhgX+VdFHOZ7z
         /AnDEqy3s8Ez+jhyCgB/opuviuO57W7F1WIUKex/k9SWfHFS//2hsZdo8pUM3zYIc+OX
         +zHUiOuM0+Q4JAa1YTxZP20WmvwprnrQC0kr3bvTiOgSAzSZ/Q+VkmW9Gx0QADcHQHk5
         1eDg==
X-Forwarded-Encrypted: i=1; AJvYcCXfJaGMWZDiIopau3DoNg+YnyCQm6K/R2cyJ+ThLzMFOLKefJrFYbJn3zJeVCczf5GJ+t31nZozuE1Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3XAsWUUHi2+2MCa+Zhe8lC7wFW+nCMl0hCvFFJbjIo+g2bNKi
	NBPRCMTCKbhQumtBHzsSbI3SVZIAuV/dE4Nnupxbbn8arQ+P9nDkRffh8GgIMOzzSriixeRNGB7
	/pBPzWnKiFTxVyIqRnJ+Z80W0sXnFEl2Rq4lYaygBEQ==
X-Gm-Gg: ASbGnct2MgL52oWLCh5mEGIhYy1oeAjyjvtZZZKxkZUHZG8rlO8C7H82XnHbOnZsUub
	RFZAkDpxWxfVoXTddoQfefw7kVGP+PZpw5zCuShEY6AYXxdM6/RFxB1GNWPTpAVMZ1+bZFMQcR0
	cmF/X7JkyM7Wc7/50RJimO+qQoESGUhrAdDTU+w2h4QzjuEdGJ3/A6nnVzO0ozP04UW4rBv65FC
	uEkyXzXVb1ekqO6wll0fp0IAoDGrqgOK3Sby9eQsQ==
X-Google-Smtp-Source: AGHT+IHROMVCGTzKbd8DUnRbxTfTlK+MR9JL62BsI9VnekLusb3BHR1u3EIZEbgGayIv2PxqmGUaZG2GMi/i6h3zKV0=
X-Received: by 2002:a05:690c:2501:b0:712:d70b:45eb with SMTP id
 00721157ae682-718a97cf4c7mr209750327b3.31.1753100887052; Mon, 21 Jul 2025
 05:28:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250721-leds-is31fl3236a-v5-0-264e841f4da9@thegoodpenguin.co.uk>
 <20250721-leds-is31fl3236a-v5-2-264e841f4da9@thegoodpenguin.co.uk> <c4e4f79b-5b1d-4cab-a8f0-49adbe30f2af@kernel.org>
In-Reply-To: <c4e4f79b-5b1d-4cab-a8f0-49adbe30f2af@kernel.org>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 21 Jul 2025 13:27:56 +0100
X-Gm-Features: Ac12FXwobXHJ83Z0DHw-PuSuMEtx3uNkAZQvuIt_cGjqWBGALi2mwf-OzhJmGjQ
Message-ID: <CAA6zWZKi-UA_=bxKLjYN=HUEue+jXtqP1kTZtGZKwep6GAMuLw@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] dt-bindings: leds: issi,is31fl3236: add support
 for is31fl3236a
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> I never spotted it before, but this should be issi,22khz-pwm. No
> properties use capital letters.

Ah, noted.

