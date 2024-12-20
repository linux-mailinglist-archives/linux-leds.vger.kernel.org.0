Return-Path: <linux-leds+bounces-3690-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5D59F98A9
	for <lists+linux-leds@lfdr.de>; Fri, 20 Dec 2024 18:52:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 425B17A5F23
	for <lists+linux-leds@lfdr.de>; Fri, 20 Dec 2024 17:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0115A22ACEF;
	Fri, 20 Dec 2024 17:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sux4smDW"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C376C21D01D
	for <linux-leds@vger.kernel.org>; Fri, 20 Dec 2024 17:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734715661; cv=none; b=eMMyC5AeFaoShdUHzCpJ3hUSKXLi7Ec2DiCAoN/fABoA2GOO4fJXCKZejZySf8ES0tpStgUpfCP2vU0yRkp88nFw5qFgCL5/6GWyJ+Hw0cJAvp+hK9NAfT4k0naUC7iSBZCdVa5xH2JC+konuz8YIfTpTXxCoT734jg0UsM2+bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734715661; c=relaxed/simple;
	bh=ftFlFL8Hf6gjCPdcRFrVx2YclVhyvU0X+h6fy2EfzIQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=N5b1xnQCZRV6nxgBsYjpmCcn4uzpiED8TmKzSDu0hFMcmzxNghoJ+Ka4FMs7PgjK9JnbkvLJ644ftBNFp2nrEUau7xEpSJ5dz1bI5R3ci1QIGN6bCPJLtW+8q0bfWy0ewjNyhWTjLDw36osFGtxfWK3ShK6Cuzs3LFbjZeZTF64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sux4smDW; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3862b364538so1264375f8f.1
        for <linux-leds@vger.kernel.org>; Fri, 20 Dec 2024 09:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734715658; x=1735320458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rl2GUGW1SKIB73yuGvAyVPoBfBy5XbBiVj4hV5yN+VI=;
        b=Sux4smDWvhRYVAocCLrB8sH5Gn4iglVnvLOtYXjw2SwmbrW98B6c98IdTir+VF+VQJ
         W10BWI4R3GFC1zT/iJoBlxuzYK0hnggsfABamHJxaKShxH8tLAyw6SYs1kiT5Zpq5DY/
         y8F5G+SxDNISHMSnfr/J8ZC+W2oNrTFwJ0KMsYltX1nRmRejzvK8hykx9rw4E4PSCPjK
         hBR+wlIXLMxbiloh7lXnf5z8TBJg0j3ePqZ9LWqb7cYYzpaMr36BzlgWIDpW6dDQHpe5
         znRcS8BpCe/go3BIeiuQzZZSpEoYEyOJCj8IeINw++6FJJgIOUIPFK+PvAzsigdqsUly
         aZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734715658; x=1735320458;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rl2GUGW1SKIB73yuGvAyVPoBfBy5XbBiVj4hV5yN+VI=;
        b=cwAZN4PqZcP3o7fq2lT2vkmpneYznJMXOLmF1Ra1PFqWPCjf+9mim7MRpK852PdBUS
         iof3XZ0KrN5GJKYovobWHPXwlmX/YhEIRu1dxjaVGH8Lgc2+2OeBTCiyp/4GtpxERqUc
         IocVV/aKcHoE8OoZyrykpQtQ/zN/9XIY7T47uF/qhdqXSdO0+FvtG58R81XaIbZ36mB2
         tzmsNjin9P9m5Wf/b5hq0EqJ748JsmhGJcWImEhuyrscDuK5Kbx5i1jMJA5KVob8+1Gp
         PvZttgzltjS/hrNO5OWwnKmejjRUijg9Zsbnw2lIhheZRCAroQl4VgVwA4Umj9DcVcq/
         FU4Q==
X-Forwarded-Encrypted: i=1; AJvYcCX/g+23ZsnOjTtLUSKP85+hW/cLC6YExRPb7twYr2w99M0Bv2tUOqSdmpWfyrYmztXpggGPLyasANql@vger.kernel.org
X-Gm-Message-State: AOJu0YzbgRq+38pQltLo1RYzS0PDvnvmAnolTLVLVltzpkEMmAP2Hlpi
	atHBSPukR54dYEP0FsENWdGnbMdpls1Z8Azm5d58veHhzg2+Ck/ZJvsuuUc29H0=
X-Gm-Gg: ASbGncvs4DJ4qboQ8ggyZpiOBZLflodi+OnU0u1NWGNv7KhRwmuZI5aSRGCl2ytQdh+
	21GCRptyUwK7QAkgk/16oMyV1T30zcS+51PVRmp1UT6nVbXfuu0l/OtEq40pfYns9S9vCbHyyI/
	AR5g6hgFX8X2fZOOx5xLw0TunFuNV98rtJIVPVoxjmrqxDjKYUB3oTh1SDBysuRPkch2CYU61PV
	xYfme4nccGcMukwtHUIQfMTNTkhFGgXlPzMx6UCx37YuKMU93kXe9k+4f+E8+5pMfKV9ZgMIpg=
X-Google-Smtp-Source: AGHT+IHQofl14bIpVpiQqz6qAEwAjKsEmWVjRCOjis6wH9jKfvKMjWLHCbYlsDgmYPDOjR7ci+Y7xw==
X-Received: by 2002:a5d:47c3:0:b0:388:cacf:24b0 with SMTP id ffacd0b85a97d-38a1a1f7253mr6745803f8f.2.1734715658179;
        Fri, 20 Dec 2024 09:27:38 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e357sm4642915f8f.72.2024.12.20.09.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 09:27:37 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: linux-gpio@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org, audit@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Zhihao Cheng <chengzhihao1@huawei.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-usb@vger.kernel.org, linux-mm@kvack.org, 
 maple-tree@lists.infradead.org, alsa-devel@alsa-project.org, 
 Sanyog Kale <sanyog.r.kale@intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, dccp@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.cz>, 
 drbd-dev@lists.linbit.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
 nvdimm@lists.linux.dev, linux-leds@vger.kernel.org, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 linuxppc-dev@lists.ozlabs.org, tipc-discussion@lists.sourceforge.net, 
 Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 linux-trace-kernel@vger.kernel.org, Neil Brown <neilb@suse.de>, 
 Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, 
 Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, linux-wireless@vger.kernel.org, 
 intel-wired-lan@lists.osuosl.org
In-Reply-To: <20240930112121.95324-1-Julia.Lawall@inria.fr>
References: <20240930112121.95324-1-Julia.Lawall@inria.fr>
Subject: Re: (subset) [PATCH 00/35] Reorganize kerneldoc parameter names
Message-Id: <173471565665.227782.7244101246430956449.b4-ty@linaro.org>
Date: Fri, 20 Dec 2024 17:27:36 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Mon, 30 Sep 2024 13:20:46 +0200, Julia Lawall wrote:
> Reorganize kerneldoc parameter names to match the parameter
> order in the function header.
> 
> The misordered cases were identified using the following
> Coccinelle semantic patch:
> 
> // <smpl>
> @initialize:ocaml@
> @@
> 
> [...]

Applied, thanks!

[31/35] slimbus: messaging: Reorganize kerneldoc parameter names
        commit: 52d3d7f7a77ee9afc6a846b415790e13e1434847

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


