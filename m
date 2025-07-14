Return-Path: <linux-leds+bounces-5055-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DD7B03A5D
	for <lists+linux-leds@lfdr.de>; Mon, 14 Jul 2025 11:09:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0283189897D
	for <lists+linux-leds@lfdr.de>; Mon, 14 Jul 2025 09:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DB8023D280;
	Mon, 14 Jul 2025 09:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="Jmrg4fTS"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65A623816E
	for <linux-leds@vger.kernel.org>; Mon, 14 Jul 2025 09:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752484179; cv=none; b=eo1gNDyS6kPgZrvSeQGU2QtsJpqXzIxQuQAh2nsE53cM7Wz/n1uYVGOIZPciEgPImBg3El/Po/tk2LsJt1GUvwu/bhzIU43qSsseXbMsmovMy3ZuDU9MOohBjmUAO9fDErjJWLZ5vGQLV/GOSRIk4ppazbf6VKcBKCA0FoFM4XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752484179; c=relaxed/simple;
	bh=rIsTjh4GLVLD+KMCZJr0+NzS5w/OyX/hLoA+6UwSt8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X335EKjCjEiD/Yav/O3SlYohXsRhChNmZOWLWBANb6ta8thNddvMaUecZz1/SHZ5Z6/3UP6SgDoFUnbFDxiliuf/NxizdhU+4UBTtqVBgsNFpInFLz2+PmBqf9EBqEUSG9ZfruNG1dwF7JXPLSGRBXf9EzPr3yLfln/r3iBSokc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=Jmrg4fTS; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-710e344bbf9so39067977b3.2
        for <linux-leds@vger.kernel.org>; Mon, 14 Jul 2025 02:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1752484177; x=1753088977; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rIsTjh4GLVLD+KMCZJr0+NzS5w/OyX/hLoA+6UwSt8A=;
        b=Jmrg4fTSkNoGP7uGFdDY0zF4L2hsIBIU1qAp3ARWsdlmTywlH+e2RhxO1U1KJZSAJ1
         7omR4Dz5UJvWvUYRjpfUd2wNa8kTxWpe7jmHvToLToTrTuR9d56TDBczo56G+acdpou1
         SM/0CQF56hRQ0KEc+eR5Htli5pMJsON3bwyfjE4FuGCEYQYDiD9vvrJVoeD+NQ/Zg2yV
         u/W0mvTnjUKI0iekiQxsnoEOlxhnEo58DKEA9xbikm+1GrQnzE1wVlsp+lhXyO/FjMfe
         GmUoZQS+tGrvXKa1XXTZ0PBf8ws7274ea83WgPgsOfqLmVTx/jYnWhYbxDC9xgK6rodr
         uSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752484177; x=1753088977;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rIsTjh4GLVLD+KMCZJr0+NzS5w/OyX/hLoA+6UwSt8A=;
        b=q+NFjHSjwPAQGEbJ33JkKrF7NNQZO26lq6uWeEQvMLNh99A5tcOd4yncYbtMPXeXX7
         IlKIyAAqD3VbD+TzGwZ7Kryq3OW6Jecv+I+lDwZ/i1fVLBsV7Fupjqrzgbudgdm/l9E/
         pu51OdEZXumAF8TfhThSwOr0NvHNvlLwWprvj3li91+LtPMhQOONpcsJ88dAyff7hVJ/
         Ll7lYu3NChuOrWy2gZwVMDx21a3M4z+KPSBSRBdPiunBwBZz19vQcBqN2urYk3tkG4Aj
         CFOgWKxir8/h7yjlYlN4N7vfn6G0s/mBHvtemsacYgaFNhTMPz6GRKso65TTTC4ezHCC
         9UkA==
X-Forwarded-Encrypted: i=1; AJvYcCU7EOcTi0q6us4mvj4JCOHCbtPWlPsC2D3y7upIY+9rwgMtziz04X/HD/DUQZ3ysl5QUD2biD17YZvn@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd+wgGubC54X1uJ5ej6gNgpcSvVmr6JNZ4SLnUvWKa0bSCLOgW
	vjAej5ddeBXQCfsmrAR48dQcbVgbcxoPyYSIpQrBtzhB3paVX0c+jJ78vVg4KVPrCYQ2QmLiweq
	skEQpfxrbW9waLeCXIj3ipnx+Ht2VRWOlO8WbGGtRgA==
X-Gm-Gg: ASbGncv2+emhfcn/rVq1t3oyksJt7IPNFEP6/I3boY0gSQxeTX0APvFF20XoYENduog
	+H7nGkrfpr72IDTxJp7M9IzX+4vMfjooCv7Htxrj1W9CCgsKLjzv53llF/r4iUsFZ0pGWRdmUmD
	CelBAd8E7d6OsR9cF5hlqz/crwc6SvTMguECWivlg7Ud4YbaWoN0JtEb+qgg57vRuWr4XipeFZX
	7qsKvIzOeV4DN7pEaFwYLS5Khy6hjR2H0GITMYmoQ==
X-Google-Smtp-Source: AGHT+IG6p+03ZW+kAVBQfuO1ja5ZeFH250eIb7vurLa/yxNs3CRNsc1yO9cE5aHgOeU75DtvArG8fmDVzC3kmVUq+Dw=
X-Received: by 2002:a05:690c:6d0d:b0:70d:f47a:7e40 with SMTP id
 00721157ae682-717d790e42emr197721017b3.16.1752484176641; Mon, 14 Jul 2025
 02:09:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250708-leds-is31fl3236a-v3-0-d68979b042dd@thegoodpenguin.co.uk>
 <20250708-leds-is31fl3236a-v3-1-d68979b042dd@thegoodpenguin.co.uk> <20250709-primitive-offbeat-toad-08930d@krzk-bin>
In-Reply-To: <20250709-primitive-offbeat-toad-08930d@krzk-bin>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 14 Jul 2025 10:09:25 +0100
X-Gm-Features: Ac12FXyAHIvvIgJoN1gPJVPX6vDJtb2BR6Gk-ucRF8u8hpHHCZ5URAzHwizSyy8
Message-ID: <CAA6zWZKVnrPoutWpKQ+qzg5zNE-dhLxWBiuAoV5vf2qHfzv-LA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] leds/leds-is31fl32xx: add support for is31fl3236a
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Bindings go before the users (see submitting patches in DT).

I think I was confused with point 7 stating that dt-binding should come
last within a series and point 6 stating it is only regarding DTS files,
missed point 5 altogether... Thanks !

