Return-Path: <linux-leds+bounces-5691-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EE0BC8E88
	for <lists+linux-leds@lfdr.de>; Thu, 09 Oct 2025 13:53:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A323E3AD677
	for <lists+linux-leds@lfdr.de>; Thu,  9 Oct 2025 11:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AD592E1C5C;
	Thu,  9 Oct 2025 11:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="fVC3ezhF"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0EB2E0B6D
	for <linux-leds@vger.kernel.org>; Thu,  9 Oct 2025 11:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760010825; cv=none; b=jGj1HlJ9hgxJ66z5YdBr6Tv4wr/LMheTEMbwNsEEQgbwtWMzDe6aI66bv78UfYIUzrAUZHMx9PJvkUD6ndrAkopzKjVxymZA+GC66Doa/5cBFkQ07DUSI3/naK33xN3pbOqu9xdOB0HBqAqjREQIR0AWeHTKcKv2IDQPh+v/TyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760010825; c=relaxed/simple;
	bh=MZtpDSAeX1Ovl9JMxKVz66NBtei7l7fHOjWklvLJYJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jIqMQYREojEiGitGriIgFl32ijLh00PjsyLdVDZFy0dfKrjdPypzl+rxounX2pJ4TBJrcwuZSdYPg6Anuu1bgVe1Ym+ANiITN5DmO5hNmt60pa+XPfbCqHj3OW6u8ptMBdR7v7W54rDJ4u9I4MSSwDPSP2zyXfSct+Cz/yMS2ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=fVC3ezhF; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46b303f7469so5274525e9.1
        for <linux-leds@vger.kernel.org>; Thu, 09 Oct 2025 04:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1760010822; x=1760615622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0YRwRsv2JGxHdPcrSfhou6/e/A3dW1zrI7PLye/j7/c=;
        b=fVC3ezhFMAmm4mdKlTYoHUvMgTE9yOcVnYxkneKBss7ZPznB9uBLiewHo21f0IDzQM
         0dOvhsO3MS6WJ/lDPMhwcc3Pp5HlUvNs9iGUfxN9EYxfsOKGMVRIA5h7Kc1R1xgR2RPD
         foOWFcYHKjn3s88Yto5jqWX05gvq/PideV/z4VXXE1bpXarlhT0t38RFPtOXWt/SyfUk
         FaN3MsurnaIDF87tZdiQ5uygO/erOIZsLfIXdbPdgorcWyzjUcF6YhwaJPUntF87zP44
         4iuBzYXKpEumhQ8B2eJxhdHEEnNxYMQGdlS5X2LTHcqaBRzPFcMDQIrGqIh147/dPBpY
         T5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760010822; x=1760615622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0YRwRsv2JGxHdPcrSfhou6/e/A3dW1zrI7PLye/j7/c=;
        b=r1WPkcPnP6YViHeh7Muni/zLRUTOSv4Z4ooJAEnb0QXIFWz+ByC4Ek7JfKnYFUEZ+r
         Nne1MVk/s9BJzQOHf131VuU+AhXYqxARHHKG+fAJzbApKyTh7EUNXB3GhYU6CSl0oRbD
         UAaZ15pR05Bp3Lq4wO/MSTtS1Xbvus+gWXzJwFrdz6TO0WyvLS0xrlFMB0G43PZyU+wk
         LcLdilXViDEQyQ50sTKL6xHH++cArKeAcgYByBttaynBFWHnDwm34StSTL7F+ZVYqEO1
         mFY+APYMwTJFoxQu7SGw3ID6gOImjvNovYt5P6P9ZB4JtWpkn3fDsBBqcA0grlAhGpHx
         M41Q==
X-Forwarded-Encrypted: i=1; AJvYcCXj6gM1E4RyAs6yWmYQm+Nc3b5m/wEYC08uekhqtFgotqEeovAY3UF+NzgLaJkVz329KVm7lsacw6hN@vger.kernel.org
X-Gm-Message-State: AOJu0YyDqmk6tz9rQ+dOIysbXSBUKDLgQAgJQlPr7BdL34C/DKh98Vx5
	3kMOvaucLjVZgUxGhfwpy1+ygWfNUbP+3f8WUlH6pe5qaL9Y3urgVwNIeatfiLGs3QU=
X-Gm-Gg: ASbGncsK2cDVf3f8p7kNJHQtC8aV0Cw2jQSO0q+xlCAl0XpcDpSHTZpnfHc4vLmrBDn
	Ajs7E31plBFaSgyK2/wi/ZtGl9b1Sve4hF7GYEp3Bp71aBGnamqEIHPL02M+XPnFZwqzwNDfvO8
	8udL506VQBiCt84sUk4AtkLWBr37l9h73/kJv/CttR2Mm9NPc6eVdfU95BucUYFalXAgAT+Ou/N
	8y4diTPzQS8PaLFkXs+9uZuxJIT3dQ+0uTyiI4oHON6N+nPfq5kfHV9XFC2gC0ojTQmmi+BeQYD
	xlTN0PaP+YPVZCYiO/baGSgJwpEQSY2KFIHVlc35pEzBIZjTdxhqtXy2Cp3A/VKp1qhnQ0ZMyij
	zfegwjw1bZ2DYBRPzVvyZ9DtVlM54+/oTBn0TEKdMhcCWcZo5tNsqVmTAoG7M/zfS
X-Google-Smtp-Source: AGHT+IFw0EStqMGoTf5b92X/Qw7EMLyDr1bZXyNDvXbXSyKiugbleDYUzHxfRXnql6r985fgqP+cfg==
X-Received: by 2002:a05:600c:6304:b0:46f:b42e:e361 with SMTP id 5b1f17b1804b1-46fb42ee3camr741295e9.41.1760010821854;
        Thu, 09 Oct 2025 04:53:41 -0700 (PDT)
Received: from hapmop ([2a02:c7c:8a3e:8c00:2f34:274b:ef90:518a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46faf1841aasm42330685e9.18.2025.10.09.04.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 04:53:41 -0700 (PDT)
From: Harrison Carter <hcarter@thegoodpenguin.co.uk>
To: robh@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	hcarter@thegoodpenguin.co.uk,
	jonas.gorski@gmail.com,
	krzk+dt@kernel.org,
	lee@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	pavel@kernel.org
Subject: Re: [PATCH] dt-bindings: leds: bcm6358: Convert to DT Schema
Date: Thu,  9 Oct 2025 12:53:39 +0100
Message-ID: <20251009115339.2340708-1-hcarter@thegoodpenguin.co.uk>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251008015210.GA1925508-robh@kernel.org>
References: <20251008015210.GA1925508-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Rob,

Thanks for looking at my patch. There's an issue in the patch anyway that's 
been noticed between the patternProperties's regex and the names of the 
led nodes. Here it's just led@... but the nodes are named thing_colour.

On and off this regex has been done as .*_.*@, led@, and .*@ . What is the 
preference? led@ would amend the led information to a label in the node. The 
latter option is very promiscuous (but not uncommon in bindings), the former 
sticks to what the examples are sort of expecting.

Cheers,

HarryC


